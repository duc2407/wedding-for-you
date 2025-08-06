import 'dart:async';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductImageCarousel extends StatefulWidget {
  final List<String> imageAssets;
  const ProductImageCarousel({super.key, required this.imageAssets});

  @override
  State<ProductImageCarousel> createState() => _ProductImageCarouselState();
}

class _ProductImageCarouselState extends State<ProductImageCarousel> {
  final PageController _pageController = PageController(viewportFraction: 0.9);
  int _currentIndex = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_pageController.hasClients) {
        final nextPage = (_currentIndex + 1) % widget.imageAssets.length;
        _pageController.animateToPage(nextPage, duration: const Duration(milliseconds: 600), curve: Curves.easeInOut);
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bool isMobile = size.width < 600;
    final double maxWidth = isMobile ? size.width * 0.9 : 400;

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: SizedBox(
                width: maxWidth,
                height: maxWidth,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: widget.imageAssets.length,
                  onPageChanged: (index) => setState(() => _currentIndex = index),
                  itemBuilder: (context, index) {
                    final isActive = index == _currentIndex;
                    return AnimatedScale(
                      scale: isActive ? 1.0 : 0.95,
                      duration: const Duration(milliseconds: 400),
                      child: Image.asset(widget.imageAssets[index], fit: BoxFit.cover),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 16),
            SmoothPageIndicator(
              controller: _pageController,
              count: widget.imageAssets.length,
              effect: WormEffect(
                dotHeight: 10,
                dotWidth: 10,
                spacing: 8,
                dotColor: Colors.grey.shade300,
                activeDotColor: Colors.pinkAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
