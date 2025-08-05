import 'package:fe_wd24/models/product_model.dart';
import 'package:fe_wd24/screens/component/cart_product.dart';
import 'package:fe_wd24/screens/detail_product/detail_product.dart';
import 'package:flutter/material.dart';

class ListProduct extends StatefulWidget {
  const ListProduct({required this.product, required this.title, super.key});
  final String title;
  final List<ProductModel> product;

  @override
  State<ListProduct> createState() => _ListProductState();
}

class _ListProductState extends State<ListProduct> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(left: 10, right: 10),
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
              Text(widget.title, style: const TextStyle(fontWeight: FontWeight.bold)),
              TextButton(onPressed: () {}, child: const Text('Xem thêm')),
            ],
          ),
        ),
        SizedBox(
          height: 290,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: widget.product.length,
            separatorBuilder: (_, __) => const SizedBox(width: 12),
            itemBuilder: (context, index) {
              final product = widget.product[index];
              return CardProduct(
                product: product,
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => ProductDetailScreen(product: product)));
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
