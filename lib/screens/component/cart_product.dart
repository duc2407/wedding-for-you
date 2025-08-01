import 'package:flutter/material.dart';
import 'package:fe_wd24/models/product_model.dart';

class CardProduct extends StatelessWidget {
  final ProductModel product;
  final VoidCallback onTap;

  const CardProduct({super.key, required this.product, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // 👉 Thay vì đẩy thẳng LoginPage, dùng callback truyền vào
      child: Container(
        width: 168,
        height: 286,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.2), blurRadius: 8)],
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Image.asset(product.imageAsset, width: 150, height: 150),
                  ),
                ),
                Padding(padding: const EdgeInsets.symmetric(horizontal: 12.0), child: Text(product.name)),
                Padding(padding: const EdgeInsets.symmetric(horizontal: 12.0), child: Text('Giá: ${product.price}')),
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: const Color.fromARGB(255, 255, 226, 248),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Sử dụng ngay',
                        style: TextStyle(color: Color.fromARGB(255, 255, 128, 128), fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              top: 10,
              right: 8,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(color: Colors.redAccent, borderRadius: BorderRadius.circular(6)),
                child: const Text(
                  'Mẫu mới',
                  style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
