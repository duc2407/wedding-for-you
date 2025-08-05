import 'package:fe_wd24/screens/about/about.dart';
import 'package:fe_wd24/screens/contact/contact_page.dart';
import 'package:fe_wd24/screens/home/home_content.dart';
import 'package:fe_wd24/screens/login/login_page.dart';
import 'package:fe_wd24/screens/orders/manage_orders.dart';
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

  final bool isLoggedIn = true;
  final String userName = 'Nguyễn Minh Đức';

  final List<Widget> pages = const [HomeContent(), ContactPage(), AboutPage(), ManagerOrder()];

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
                    _navItem('Liên hệ', 1),
                    _navItem('Giới thiệu', 2),
                    if (isLoggedIn)
                      Row(children: [_navItem('Đã mua', 3), _buildUserMenu()])
                    else
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

  Widget _buildUserMenu() {
    return DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        icon: Row(
          children: [
            const CircleAvatar(
              radius: 14,
              backgroundColor: Colors.pink,
              child: Icon(Icons.person, color: Colors.white, size: 16),
            ),
            const SizedBox(width: 8),
            Text(userName, style: GoogleFonts.openSans(fontSize: 14, fontWeight: FontWeight.w600)),
            const SizedBox(width: 4),
            const Icon(Icons.keyboard_arrow_down, color: Colors.black),
          ],
        ),
        onChanged: (value) {
          if (value == 'logout') {
            Navigator.push(context, MaterialPageRoute(builder: (_) => const LoginPage()));
          }
        },
        items: [
          DropdownMenuItem(
            value: 'logout',
            child: Text('Đăng xuất', style: GoogleFonts.openSans()),
          ),
        ],
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
              if (isLoggedIn)
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Row(
                    children: [
                      const CircleAvatar(
                        radius: 18,
                        backgroundColor: Colors.pink,
                        child: Icon(Icons.person, color: Colors.white, size: 18),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(userName, style: GoogleFonts.openSans(fontSize: 16, fontWeight: FontWeight.w600)),
                      ),
                    ],
                  ),
                ),
              _mobileMenuItem('Trang chủ', 0, Icons.home),
              _mobileMenuItem('Liên hệ', 1, Icons.contact_mail),
              _mobileMenuItem('Giới thiệu', 2, Icons.info_outline),
              const Divider(),
              if (!isLoggedIn)
                _mobileMenuItem('Đăng nhập', null, Icons.login, goToLogin: true)
              else ...[
                _mobileMenuItem('Đã mua', 3, Icons.check_circle_outline),
                _mobileMenuItem(
                  'Đăng xuất',
                  null,
                  Icons.logout,
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) => const LoginPage()));
                  },
                ),
              ],
            ],
          ),
        );
      },
    );
  }

  Widget _mobileMenuItem(String label, int? index, IconData icon, {bool goToLogin = false, void Function()? onTap}) {
    return ListTile(
      leading: Icon(icon, color: TWColors.pink.shade400),
      title: Text(label, style: GoogleFonts.openSans(fontSize: 16, fontWeight: FontWeight.w600)),
      onTap: () {
        Navigator.pop(context);
        if (onTap != null) {
          onTap();
        } else if (goToLogin) {
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
