import 'package:fe_wd24/models/product_model.dart';
import 'package:fe_wd24/screens/component/list_product.dart';
import 'package:flutter/material.dart';

class ListproductsPage extends StatefulWidget {
  const ListproductsPage({super.key});

  @override
  State<ListproductsPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ListproductsPage> {
  List<ProductModel> mockProducts = [
    ProductModel(
      name: 'Mẫu Saphia',
      imageAsset: 'assets/images/product1.jpg',
      price: '199.000đ',
      description: 'Thiệp Saphia với thiết kế truyền thống, nền hồng pastel.',
    ),
    ProductModel(
      name: 'Mẫu Ruby',
      imageAsset: 'assets/images/product1.jpg',
      price: '229.000đ',
      description: 'Mẫu Ruby hiện đại, sang trọng và tinh tế.',
    ),
    ProductModel(
      name: 'Mẫu Saphia',
      imageAsset: 'assets/images/product1.jpg',
      price: '199.000đ',
      description: 'Thiệp Saphia với thiết kế truyền thống, nền hồng pastel.',
    ),
    ProductModel(
      name: 'Mẫu Ruby',
      imageAsset: 'assets/images/product1.jpg',
      price: '229.000đ',
      description: 'Mẫu Ruby hiện đại, sang trọng và tinh tế.',
    ),
    // Thêm mẫu khác nếu cần
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Danh sách mẫu: '),
              const SizedBox(height: 12),
              ListProduct(product: mockProducts, title: 'Các mẫu mới'),
              const SizedBox(height: 12),
              ListProduct(product: mockProducts, title: 'Các mẫu nổi bật'),
              const SizedBox(height: 12),
              ListProduct(product: mockProducts, title: 'Các mẫu nổi bật'),
            ],
          ),
        ),
      ),
    );
  }
}
