import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tailwind_colors/tailwind_colors.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool agreeTerms = false;
  bool showPassword = false;

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
                        fontSize: isMobile ? 32 : 40,
                        fontWeight: FontWeight.bold,
                        color: TWColors.pink.shade400,
                      ),
                    ),
                    const SizedBox(height: 32),

                    TextField(
                      controller: _phoneController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        labelText: 'Số điện thoại',
                        prefixIcon: const Icon(Icons.phone),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                    ),
                    const SizedBox(height: 16),

                    TextField(
                      controller: _passwordController,
                      obscureText: !showPassword,
                      decoration: InputDecoration(
                        labelText: 'Mật khẩu',
                        prefixIcon: const Icon(Icons.lock_outline),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                        suffixIcon: IconButton(
                          icon: Icon(showPassword ? Icons.visibility : Icons.visibility_off),
                          onPressed: () => setState(() => showPassword = !showPassword),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    TextField(
                      controller: _confirmPasswordController,
                      obscureText: !showPassword,
                      decoration: InputDecoration(
                        labelText: 'Nhập lại mật khẩu',
                        prefixIcon: const Icon(Icons.lock),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                    ),
                    const SizedBox(height: 8),

                    Row(
                      children: [
                        Checkbox(value: agreeTerms, onChanged: (val) => setState(() => agreeTerms = val ?? false)),
                        Expanded(
                          child: Text.rich(
                            TextSpan(
                              text: 'Tôi đồng ý với ',
                              children: [
                                TextSpan(
                                  text: 'Điều khoản & Chính sách',
                                  style: const TextStyle(color: Colors.blue),
                                ),
                              ],
                            ),
                            style: const TextStyle(fontSize: 14),
                          ),
                        ),
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
                      child: const Text("Đăng ký", style: TextStyle(fontSize: 16)),
                    ),
                    const SizedBox(height: 24),
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text("Đã có tài khoản? Đăng nhập"),
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
