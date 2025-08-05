import 'package:fe_wd24/animations/step_create_website/steps_intro_section.dart';
import 'package:fe_wd24/models/product_model.dart';
import 'package:fe_wd24/screens/component/cart_product.dart';
import 'package:fe_wd24/screens/component/list_product.dart';
import 'package:fe_wd24/screens/detail_product/detail_product.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tailwind_colors/tailwind_colors.dart';

class HomeContent extends StatefulWidget {
  const HomeContent({super.key});

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
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
    return SingleChildScrollView(
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1000),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                // Container(
                //   padding: const EdgeInsets.only(left: 16, right: 16),
                //   decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.white),
                //   child: Row(
                //     children: [
                //       Expanded(
                //         flex: 2,
                //         child: Column(
                //           children: [
                //             Text(
                //               'Tự thiết kế thiệp cưới',
                //               style: GoogleFonts.openSans(
                //                 fontSize: 16,
                //                 fontWeight: FontWeight.bold,
                //                 color: TWColors.pink.shade500,
                //               ),
                //             ),
                //             Text(
                //               'chưa bao giờ dễ dàng đến thế',
                //               style: GoogleFonts.openSans(
                //                 fontSize: 14,
                //                 fontWeight: FontWeight.bold,
                //                 color: TWColors.pink.shade500,
                //               ),
                //             ),
                //           ],
                //         ),
                //       ),
                //       const SizedBox(width: 16),
                //       SizedBox(width: 200, child: Image.asset('assets/images/banner.jpg', fit: BoxFit.cover)),
                //     ],
                //   ),
                // ),
                Container(
                  child: Column(
                    children: [
                      Text(
                        "Wedding for you",
                        style: GoogleFonts.playfairDisplay(
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                          color: TWColors.pink.shade500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        "luôn đồng hành cùng ngày vui của bạn!!!",
                        style: GoogleFonts.openSans(fontSize: 18, color: Colors.grey[700]),
                        textAlign: TextAlign.center,
                      ),
                      // const SizedBox(height: 40),
                      // ElevatedButton(
                      //   style: ElevatedButton.styleFrom(
                      //     backgroundColor: const Color.fromARGB(255, 255, 153, 189),
                      //     foregroundColor: Colors.white,
                      //     padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                      //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      //   ),
                      //   onPressed: () {},
                      //   child: const Text("Thử ngay nào"),
                      // ),
                      const SizedBox(height: 24),
                    ],
                  ),
                ),

                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.white),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(left: 16, right: 16),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.white),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Column(
                                children: [
                                  Text(
                                    'Tự thiết kế thiệp cưới',
                                    style: GoogleFonts.openSans(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: TWColors.pink.shade500,
                                    ),
                                  ),
                                  Text(
                                    'chưa bao giờ dễ dàng đến thế',
                                    style: GoogleFonts.openSans(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: TWColors.pink.shade500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 16),
                            SizedBox(width: 200, child: Image.asset('assets/images/banner.jpg', fit: BoxFit.cover)),
                          ],
                        ),
                      ),
                      Text(
                        'Chỉ cần thực hiện 3 bước đơn giản để tạo ra thiệp cưới độc đáo của riêng bạn.',
                        style: GoogleFonts.openSans(fontSize: 14, color: Colors.grey[700]),
                        textAlign: TextAlign.center,
                      ),
                      StepSliderEffect(),

                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 255, 153, 189),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                        onPressed: () {},
                        child: const Text("Thử ngay nào"),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                ListProduct(product: mockProducts, title: 'Các mẫu mới'),
                const SizedBox(height: 24),
                ListProduct(product: mockProducts, title: 'Các mẫu nổi bật'),
                const SizedBox(height: 24),
                const Text('Bản quyền bởi @ducit247'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _section(String title) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 255, 153, 189),
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 10,
            offset: Offset(2, 4), // đổ bóng nhẹ bên dưới
          ),
        ],
      ),
      // decoration: BoxDecoration(
      //   borderRadius: BorderRadius.circular(6),
      //   color: const Color.fromARGB(255, 255, 153, 189),
      //   boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.1), blurRadius: 8)],
      // ),
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      // color: const Color.fromARGB(255, 255, 153, 189),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text(title), Text('Xem thêm')]),
    );
  }

  Widget _horizontalList(BuildContext context) {
    return SizedBox(
      height: 290,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: mockProducts.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final product = mockProducts[index];
          return CardProduct(
            product: product,
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => ProductDetailScreen(product: product)));
            },
          );
        },
      ),
    );
  }
}
