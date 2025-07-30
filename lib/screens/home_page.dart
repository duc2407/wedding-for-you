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
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              color: Colors.white,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  bool isMobile = constraints.maxWidth < 800;

                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Logo
                      Text(
                        'Wed4U',
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
                            const Text('Trang chủ'),
                            const SizedBox(width: 16),
                            const Text('Giới thiệu'),
                            const SizedBox(width: 16),
                            const Text('Liên hệ'),
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
                                // TODO: Mở menu
                              },
                            ),
                            const SizedBox(width: 8),
                            IconButton(
                              icon: const Icon(Icons.login),
                              color: TWColors.pink.shade400,
                              onPressed: () {
                                // TODO: Login
                              },
                            ),
                          ],
                        ),
                    ],
                  );
                },
              ),
            ),

            Expanded(
              child: SizedBox(
                height: double.infinity,
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
                              "Welcome to Our Wedding",
                              style: GoogleFonts.playfairDisplay(
                                fontSize: 48,
                                fontWeight: FontWeight.bold,
                                color: TWColors.pink.shade500,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 16),
                            Text(
                              "Join us in celebrating the most beautiful day of our lives.",
                              style: GoogleFonts.openSans(fontSize: 18, color: Colors.grey[700]),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 40),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: TWColors.pink.shade300,
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                              ),
                              onPressed: () {},
                              child: const Text("View Our Story"),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
