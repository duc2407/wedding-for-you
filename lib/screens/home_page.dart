import 'package:fe_wd24/screens/about/about.dart';
import 'package:fe_wd24/screens/contact/contact_page.dart';
import 'package:fe_wd24/screens/home/home_content.dart';
import 'package:fe_wd24/screens/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tailwind_colors/tailwind_colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  final List<Widget> pages = const [
    HomeContent(), // Trang chính
    ContactPage(), // Trang liên hệ (tạm thời)
    AboutPage(), // Trang giới thiệu (tạm thời)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            Expanded(
              child: IndexedStack(index: currentIndex, children: pages),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final bool isMobile = constraints.maxWidth < 800;

        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          color: const Color.fromARGB(255, 255, 236, 236),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Logo
              Text(
                'Wedding4U',
                style: GoogleFonts.playfairDisplay(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: TWColors.pink.shade500,
                ),
              ),

              // Navigation
              if (!isMobile)
                Row(
                  children: [
                    _navItem('Trang chủ', 0),
                    _navItem('Giới thiệu', 1),
                    _navItem('Liên hệ', 2),
                    const SizedBox(width: 24),
                    TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_) => const LoginPage()));
                      },
                      child: Text(
                        'Đăng nhập',
                        style: GoogleFonts.openSans(
                          fontSize: 16,
                          color: TWColors.pink.shade400,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                )
              else
                IconButton(icon: const Icon(Icons.menu), color: TWColors.gray.shade700, onPressed: showMobileMenu),
            ],
          ),
        );
      },
    );
  }

  Widget _navItem(String title, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          currentIndex = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Text(
          title,
          style: GoogleFonts.openSans(
            fontSize: 16,
            color: currentIndex == index ? TWColors.pink.shade600 : TWColors.gray.shade700,
            fontWeight: currentIndex == index ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }

  void showMobileMenu() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _mobileMenuItem('Trang chủ', 0, Icons.home),
              _mobileMenuItem('Dịch vụ', 1, Icons.contact_mail),
              _mobileMenuItem('Giới thiệu', 2, Icons.info_outline),
              _mobileMenuItem('Đăng nhập', 3, Icons.login, goToLogin: true),
            ],
          ),
        );
      },
    );
  }

  Widget _mobileMenuItem(String label, int? index, IconData icon, {bool goToLogin = false}) {
    return ListTile(
      leading: Icon(icon, color: TWColors.pink.shade400),
      title: Text(label, style: GoogleFonts.openSans(fontSize: 16, fontWeight: FontWeight.w600)),
      onTap: () {
        Navigator.pop(context);
        if (goToLogin) {
          Navigator.push(context, MaterialPageRoute(builder: (_) => const LoginPage()));
        } else if (index != null) {
          setState(() {
            currentIndex = index;
          });
        }
      },
    );
  }
}
