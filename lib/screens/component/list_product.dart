import 'package:flutter/material.dart';
import 'package:fe_wd24/models/product_model.dart';
import 'package:fe_wd24/screens/component/cart_product.dart';
import 'package:fe_wd24/screens/detail_product/detail_product.dart';

class ListProduct extends StatelessWidget {
  const ListProduct({required this.product, required this.title, super.key});
  final String title;
  final List<ProductModel> product;

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          width: double.infinity,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 255, 153, 189),
            borderRadius: BorderRadius.circular(6),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 10,
                offset: const Offset(2, 4),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
              TextButton(onPressed: () {}, child: const Text('Xem thêm')),
            ],
          ),
        ),
        const SizedBox(height: 10),
        isMobile
            ? SizedBox(
                height: 290,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  itemCount: product.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 12),
                  itemBuilder: (context, index) {
                    final p = product[index];
                    return SizedBox(
                      child: CardProduct(
                        product: p,
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (_) => ProductDetailScreen(product: p)));
                        },
                      ),
                    );
                  },
                ),
              )
            : Padding(
                padding: const EdgeInsets.all(10),
                child: Wrap(
                  spacing: 16,
                  runSpacing: 16,
                  children: product.map((p) {
                    return SizedBox(
                      child: CardProduct(
                        product: p,
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (_) => ProductDetailScreen(product: p)));
                        },
                      ),
                    );
                  }).toList(),
                ),
              ),
      ],
    );
  }
}
