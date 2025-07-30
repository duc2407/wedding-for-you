import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tailwind_colors/tailwind_colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
                                "Bạn cần thiệp cười ư??? ",
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
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.menu),
                  color: TWColors.gray.shade700,
                  onPressed: () {
                    // TODO: Open drawer or overlay
                  },
                ),
                // const SizedBox(width: 8),
                // IconButton(
                //   icon: const Icon(Icons.login),
                //   color: TWColors.pink.shade400,
                //   onPressed: () {
                //     // TODO: Login
                //   },
                // ),
              ],
            ),
        ],
      ),
    );
  }

  Widget _navItem(String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Text(label, style: GoogleFonts.openSans(fontSize: 16, color: TWColors.gray.shade800)),
    );
  }
}
