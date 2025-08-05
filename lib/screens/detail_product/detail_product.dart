// ignore: deprecated_member_use
import 'dart:html' as html;
import 'package:fe_wd24/screens/payment/payment_page.dart';
import 'package:flutter/material.dart';
import 'package:fe_wd24/models/product_model.dart';
import 'package:fe_wd24/screens/component/evaluate_user.dart';
import 'package:fe_wd24/screens/component/list_images_product.dart';
import 'package:fe_wd24/screens/component/list_product.dart';

class ProductDetailScreen extends StatelessWidget {
  final ProductModel product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
        backgroundColor: Colors.pinkAccent,
        foregroundColor: Colors.white,
        elevation: 2,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          bool isDesktop = constraints.maxWidth > 800;

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: isDesktop
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 5,
                          child: ProductImageCarousel(
                            imageAssets: [
                              'assets/images/product1.jpg',
                              'assets/images/product1.jpg',
                              'assets/images/product1.jpg',
                            ],
                          ),
                        ),
                        const SizedBox(width: 32),
                        Expanded(flex: 6, child: _buildDetailSection(context)),
                      ],
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ProductImageCarousel(
                          imageAssets: [
                            'assets/images/product1.jpg',
                            'assets/images/product1.jpg',
                            'assets/images/product1.jpg',
                          ],
                        ),
                        const SizedBox(height: 20),
                        _buildDetailSection(context),
                      ],
                    ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildDetailSection(BuildContext context) {
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
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(product.description, style: const TextStyle(fontSize: 16, height: 1.5)),
        const SizedBox(height: 12),

        Row(
          children: const [
            Icon(Icons.favorite, color: Colors.pinkAccent, size: 20),
            SizedBox(width: 6),
            Text('Số lượt dùng: ', style: TextStyle(fontWeight: FontWeight.w500)),
            Text('1024'),
          ],
        ),
        const SizedBox(height: 16),

        Row(
          children: [
            Expanded(
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pinkAccent,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => PaymentPages(
                        templateId: 'TPL123', // mã mẫu
                        templatePrice: 490000,
                        userName: 'Nguyễn Minh Đức',
                      ),
                    ),
                  );
                },
                icon: const Icon(Icons.check, color: Colors.white),
                label: const Text('Sử dụng', style: TextStyle(color: Colors.white)),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.pinkAccent,
                  side: const BorderSide(color: Colors.pinkAccent),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                onPressed: () {
                  html.window.open('https://www.mewedding.vn/giao-dien-flowers-pro', '_blank');
                },
                icon: const Icon(Icons.visibility),
                label: const Text('Xem Demo'),
              ),
            ),
          ],
        ),

        const SizedBox(height: 12),
        Text(
          'Thiệp cưới "Saphia" mang nét tinh tế kết hợp giữa truyền thống và hiện đại. '
          'Với tông màu hồng pastel dịu dàng, thiết kế được chăm chút đến từng chi tiết, '
          'phù hợp cho các cặp đôi yêu sự nhẹ nhàng, thanh lịch và ý nghĩa.',
          style: TextStyle(fontSize: 16, height: 1.6, color: Colors.grey[800]),
        ),

        const SizedBox(height: 32),
        ListProduct(product: mockProducts, title: 'Các mẫu tương tự'),
        const SizedBox(height: 24),
        const RatingBox(),
      ],
    );
  }
}
