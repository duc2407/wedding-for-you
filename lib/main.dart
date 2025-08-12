import 'package:fe_wd24/animations/animated_heart_overlay.dart';
import 'package:fe_wd24/animations/contact.dart';
import 'package:fe_wd24/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:tailwind_colors/tailwind_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) => Stack(
        children: [
          ResponsiveBreakpoints.builder(
            child: child!,
            breakpoints: [
              const Breakpoint(start: 0, end: 450, name: MOBILE),
              const Breakpoint(start: 451, end: 800, name: TABLET),
              const Breakpoint(start: 801, end: 1200, name: DESKTOP),
            ],
          ),
          const AnimatedHeartOverlay(),
          const FloatingContactButton(),
        ],
      ),
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        scaffoldBackgroundColor: TWColors.gray.shade50,
        textTheme: GoogleFonts.interTextTheme(),
        colorScheme: ColorScheme.fromSeed(seedColor: TWColors.pink.shade300),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
