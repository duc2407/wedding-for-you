import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:fe_wd24/animations/step_create_website/steps_intro_section.dart';
import 'package:fe_wd24/core/app_colors.dart';
import 'package:fe_wd24/core/widgets/cross_fade_text.dart';
import 'package:fe_wd24/core/widgets/feature_card.dart';
import 'package:fe_wd24/core/widgets/widget_support.dart';
import 'package:fe_wd24/models/product_model.dart';
import 'package:fe_wd24/screens/component/cart_product.dart';
import 'package:fe_wd24/screens/component/footer_widget.dart';
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
    // ProductModel(
    //   name: 'Mẫu Ruby',
    //   imageAsset: 'assets/images/product1.jpg',
    //   price: '229.000đ',
    //   description: 'Mẫu Ruby hiện đại, sang trọng và tinh tế.',
    // ),
    // ProductModel(
    //   name: 'Mẫu Saphia',
    //   imageAsset: 'assets/images/product1.jpg',
    //   price: '199.000đ',
    //   description: 'Thiệp Saphia với thiết kế truyền thống, nền hồng pastel.',
    // ),
    // ProductModel(
    //   name: 'Mẫu Ruby',
    //   imageAsset: 'assets/images/product1.jpg',
    //   price: '229.000đ',
    //   description: 'Mẫu Ruby hiện đại, sang trọng và tinh tế.',
    // ),
    // Thêm mẫu khác nếu cần
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundLightest,
      body: SingleChildScrollView(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1000),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Center(
                    child: Column(
                      children: [
                        Text("WEDDING FOR YOU", style: AppWidget.pinktextstyle(40), textAlign: TextAlign.center),
                        SizedBox(
                          height: 50,
                          child: CrossFadeText(
                            texts: ['Thiệp Cưới Online', 'Mời Cưới Online', 'Mừng Cưới Online'],
                            style: AppWidget.normaltextstyle(32),
                            duration: Duration(milliseconds: 1500),
                            pause: Duration(seconds: 1),
                          ),
                        ),
                        Text(
                          "Luôn đồng hành cùng bạn trong ngày trọng đại!",
                          style: AppWidget.normaltextstyle(16),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  heightSpace(10),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.white),
                    child: Column(
                      children: [
                        Container(
                          // padding: const EdgeInsets.only(left: 16, right: 16),
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.white),
                          child: Expanded(
                            flex: 2,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  children: [
                                    Text('Tạo thiệp cưới chưa bao giờ', style: AppWidget.headlinertextstyle(15)),
                                    AnimatedTextKit(
                                      animatedTexts: [
                                        WavyAnimatedText(
                                          'dễ dàng đến thế',
                                          textStyle: AppWidget.pinktexnormaltstyle(16),
                                        ),
                                      ],
                                      isRepeatingAnimation: true,
                                    ),
                                  ],
                                ),
                                const SizedBox(width: 16),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width / 2.7,
                                  child: Image.asset('assets/images/banner.jpg', fit: BoxFit.cover),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Text(
                          'Chỉ cần thực hiện 3 bước đơn giản để tạo ra thiệp cưới độc đáo của riêng bạn.',
                          style: AppWidget.normaltextstyle(14),
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
                  heightSpace(10),
                  Material(
                    borderRadius: BorderRadius.circular(20),
                    elevation: 2,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.white),
                      child: Container(
                        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Giới thiệu \n'
                              'Website Đám Cưới - Thiệp cưới Online',
                              style: AppWidget.pinktexnormaltstyle(15),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              'Thiệp cưới online, Website đám cưới là 1 trang web dành riêng cho đám cưới của các cặp đôi. Nơi dùng để lưu trữ những khoảnh khắc, kỷ niệm, hình ảnh, video cưới 1 cách mãi mãi.Là trang web dùng để mời cưới tới bạn bè và người thân thay cho những chiếc thiệp giấy cổ điển, là chiếc thiệp cưới thời 5.0 với rất nhiều tính năng và sự hữu ích. Nơi cung cấp đầy đủ các thông tin cưới cho khách mời của bạn, giúp bạn dễ dàng chia sẻ đến mọi người, mời cưới dễ dàng sành điệu, lưu trữ và chia sẽ câu chuyện tình yêu, album ảnh cưới đến mọi người. Cho phép mọi người gửi lời chúc mừng, gửi tiền mừng cưới online, và có thể xác nhận tham dự đám cưới của bạn...thật tuyệt phải không !!',
                              style: AppWidget.normaltextstyle(15),
                              textAlign: TextAlign.justify,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  heightSpace(10),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          int crossAxisCount = constraints.maxWidth < 600 ? 1 : 2;
                          return GridView.count(
                            crossAxisCount: crossAxisCount,
                            shrinkWrap: true, // co lại vừa đủ nội dung
                            physics: NeverScrollableScrollPhysics(), // tắt scroll
                            children: <Widget>[
                              FeatureCard(
                                title: "1. Thông tin Đám cưới",
                                content:
                                    "- Thông tin Cô Dâu & Chú Rể\n- Địa điểm tổ chức hôn lễ, tiệc mừng\n- Thời gian diễn ra sự kiện (Time line...)\n- Các sự kiện cưới (Tiệc cưới, lễ cưới,...)\n- Bố mẹ 2 bên + Tư gia 2 nhà",
                              ),
                              FeatureCard(
                                title: "2. Chia sẻ Cảm xúc",
                                content:
                                    "- Chia sẻ Album ảnh cưới và Video cuối.\n- Câu chuyện tình yêu của Dâu Rể.\n- Hành trình yêu, các dấu mốc thời gian.\n- Giới thiệu riêng cô Dâu chú Rể.",
                              ),
                              FeatureCard(
                                title: "3. Các tính năng Thiệp cưới",
                                content:
                                    "- Gửi lời chúc mừng đám cưới + quản lý lc.\n- Xác nhận tham dự đám cưới.\n- Quản lý danh sách khách mời tham dự.\n- Mừng cưới online qua STK, mã QR Code.\n- Để ngưởi thổi đèn tối sự kiện cưới.",
                              ),
                              FeatureCard(
                                title: "4. Quyền lợi & Quà tặng",
                                content:
                                    "- Hỗ trợ 24/7 mọi lúc mọi nơi.\n- Chỉnh sửa thiệp không giới hạn.\n- Tùy biến thiệp, thay đổi theo ý bạn.\n- Designer tạo 3 nền khung làm thiệp.\n- Tặng Video Chibi, Animation, đa dạng mẫu mời.\n- Tặng logo theo tên dâu rể, thiết kế riêng.",
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),

                  heightSpace(10),
                  ListProduct(product: mockProducts, title: 'Các mẫu mới'),
                  const SizedBox(height: 24),
                  ListProduct(product: mockProducts, title: 'Các mẫu nổi bật'),
                  const SizedBox(height: 24),
                  FooterWidget(),
                ],
              ),
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
      padding: const EdgeInsets.all(10),
      width: double.infinity,
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
