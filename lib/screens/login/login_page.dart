import 'package:fe_wd24/screens/signup/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tailwind_colors/tailwind_colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TWColors.gray.shade50,
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isMobile = constraints.maxWidth < 600;

          return Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: isMobile ? 24 : 48, vertical: isMobile ? 32 : 64),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 500),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Wedding4U',
                      style: GoogleFonts.playfairDisplay(
                        fontSize: isMobile ? 36 : 40,
                        fontWeight: FontWeight.bold,
                        color: TWColors.pink.shade400,
                      ),
                    ),
                    const SizedBox(height: 32),

                    // Email
                    TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        prefixIcon: const Icon(Icons.email_outlined),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                    ),
                    const SizedBox(height: 16),

                    TextField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Mật khẩu',
                        prefixIcon: const Icon(Icons.lock_outline),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                    ),
                    const SizedBox(height: 8),

                    Row(
                      children: [
                        Checkbox(value: rememberMe, onChanged: (val) => setState(() => rememberMe = val ?? false)),
                        const Text("Nhớ đăng nhập"),
                      ],
                    ),
                    const SizedBox(height: 16),

                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: TWColors.pink.shade400,
                        foregroundColor: Colors.white,
                        minimumSize: const Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                      onPressed: () {},
                      child: const Text("Đăng nhập", style: TextStyle(fontSize: 16)),
                    ),
                    const SizedBox(height: 24),

                    const Text("Hoặc đăng nhập bằng", style: TextStyle(color: Colors.grey)),
                    const SizedBox(height: 16),

                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton.icon(
                            style: OutlinedButton.styleFrom(
                              foregroundColor: Colors.black,
                              side: const BorderSide(color: Colors.grey),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                              minimumSize: const Size(0, 48),
                            ),
                            icon: const FaIcon(FontAwesomeIcons.google),
                            label: const Text("Google"),
                            onPressed: () {},
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: OutlinedButton.icon(
                            style: OutlinedButton.styleFrom(
                              foregroundColor: Colors.blue[800],
                              side: BorderSide(color: Colors.blue.shade100),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                              minimumSize: const Size(0, 48),
                            ),
                            icon: const FaIcon(FontAwesomeIcons.facebook),
                            label: const Text("Facebook"),
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    const Text("Chưa có tài khoản?"),
                    const SizedBox(height: 8),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: TWColors.pink.shade400,
                        foregroundColor: Colors.white,
                        minimumSize: const Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_) => const RegisterPage()));
                      },
                      child: const Text("Đăng ký", style: TextStyle(fontSize: 16)),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
