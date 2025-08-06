import 'package:fe_wd24/screens/component/footer_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    final isTablet = screenWidth >= 600 && screenWidth < 1024;
    final isDesktop = screenWidth >= 1024;

    final horizontalPadding = isMobile
        ? 20.0
        : isTablet
        ? 40.0
        : 100.0;

    final imageSize = isMobile ? 100.0 : 150.0;

    final bodyTextStyle = GoogleFonts.openSans(fontSize: isMobile ? 14 : 16, height: 1.5);

    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Wedding For You',
              style: GoogleFonts.playfairDisplay(fontSize: isMobile ? 22 : 28, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),

            Image.asset('assets/images/logo_bg.png', width: imageSize, height: imageSize),
            const SizedBox(height: 20),

            Text(
              'Wedding for you luôn đồng hành cùng ngày trọng đại của bạn',
              style: GoogleFonts.playfairDisplay(
                fontSize: isMobile ? 16 : 20,
                fontWeight: FontWeight.w600,
                fontStyle: FontStyle.italic,
                color: Colors.pinkAccent,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),

            Text(
              'Chào mừng bạn đến với Wedding4U – nền tảng thiệp cưới online hiện đại dành riêng cho thế hệ trẻ.\n\n'
              'Chúng tôi hiểu rằng việc chuẩn bị đám cưới đôi khi có thể phức tạp và tốn kém. Vì vậy, Wedding4U ra đời với mục tiêu giúp các cặp đôi dễ dàng tạo ra một trang web cưới đẹp mắt, đầy đủ thông tin và mang dấu ấn cá nhân – chỉ trong vài phút.\n\n'
              'Chỉ cần 3 bước đơn giản:\n'
              '1. Chọn mẫu thiệp cưới\n'
              '2. Nhập thông tin cô dâu – chú rể và sự kiện\n'
              '3. Nhận ngay đường link website cưới để chia sẻ đến mọi người\n\n'
              'Không cần kỹ năng thiết kế, không cần tốn nhiều thời gian. Chúng tôi làm tất cả để bạn có thể tập trung tận hưởng khoảnh khắc trọng đại của cuộc đời mình.',
              style: bodyTextStyle,
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 30),

            Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Thông tin liên hệ:',
                    style: GoogleFonts.openSans(fontSize: isMobile ? 16 : 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text('👤 Người quản lý: Nguyễn Minh Đức'),
                  Text('📧 Email: ducdev.contact@gmail.com'),
                  Text('📞 Số điện thoại: 039.503.1862 - 093.651.2297'),
                  Text('🌐 Website: https://wedding4u.online'),
                ],
              ),
            ),
            const SizedBox(height: 20),

            Text(
              'Nếu bạn cần hỗ trợ, vui lòng liên hệ qua email hoặc hotline. Đội ngũ Wedding4U sẵn sàng hỗ trợ bạn 24/7 để mang đến trải nghiệm tốt nhất.',
              style: GoogleFonts.openSans(fontSize: isMobile ? 13 : 14, color: Colors.grey[700]),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),

            Text(
              'Cảm ơn bạn đã tin tưởng và sử dụng dịch vụ của chúng tôi.',
              style: GoogleFonts.openSans(fontSize: isMobile ? 13 : 14, fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
            FooterWidget(),
          ],
        ),
      ),
    );
  }
}
