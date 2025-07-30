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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final bool isMobile = constraints.maxWidth < 800;

            return Column(
              children: [
                _buildHeader(isMobile),
                Expanded(
                  child: SingleChildScrollView(
                    child: Center(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 1000),
                        child: Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Bạn cần thiệp cưới ư???",
                                style: GoogleFonts.playfairDisplay(
                                  fontSize: 48,
                                  fontWeight: FontWeight.bold,
                                  color: TWColors.pink.shade500,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 16),
                              Text(
                                "Wedding for you chào mừng bạn!!!",
                                style: GoogleFonts.openSans(fontSize: 18, color: Colors.grey[700]),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 40),
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
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _navItem(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(title, style: GoogleFonts.openSans(fontSize: 16, color: TWColors.gray.shade700)),
    );
  }

  Widget _buildHeader(bool isMobile) {
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
                _navItem('Trang chủ'),
                _navItem('Giới thiệu'),
                _navItem('Liên hệ'),
                const SizedBox(width: 24),
                TextButton(
                  onPressed: () {},
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
              _mobileMenuItem('Trang chủ', Icons.home, () {
                Navigator.pop(context);
                print("Đi tới Trang chủ");
                // Navigator.push(...); hoặc Navigator.of(context).pushNamed('/');
              }),
              _mobileMenuItem('Giới thiệu', Icons.info_outline, () {
                Navigator.pop(context);
                print("Đi tới Giới thiệu");
              }),
              _mobileMenuItem('Liên hệ', Icons.contact_mail, () {
                Navigator.pop(context);
                print("Đi tới Liên hệ");
              }),
              _mobileMenuItem('Đăng nhập', Icons.login, () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (_) => const LoginPage()));
              }),
            ],
          ),
        );
      },
    );
  }

  Widget _mobileMenuItem(String label, IconData icon, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: TWColors.pink.shade400),
      title: Text(label, style: GoogleFonts.openSans(fontSize: 16, fontWeight: FontWeight.w600)),
      onTap: onTap,
    );
  }
}
