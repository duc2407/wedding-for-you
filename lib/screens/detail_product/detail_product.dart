import 'package:flutter/material.dart';
import 'package:fe_wd24/models/product_model.dart';

class ProductDetailScreen extends StatelessWidget {
  final ProductModel product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.name)),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [Image.asset(product.imageAsset), const SizedBox(height: 16), Text(product.description)],
        ),
      ),
    );
  }
}
