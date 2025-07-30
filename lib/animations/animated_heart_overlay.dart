import 'dart:math';
import 'package:flutter/material.dart';

class AnimatedHeartOverlay extends StatefulWidget {
  const AnimatedHeartOverlay({super.key});

  @override
  State<AnimatedHeartOverlay> createState() => _AnimatedHeartOverlayState();
}

class _AnimatedHeartOverlayState extends State<AnimatedHeartOverlay> with TickerProviderStateMixin {
  final List<_Heart> _hearts = [];
  final Random _random = Random();

  @override
  void initState() {
    super.initState();
    _startSpawning();
  }

  void _startSpawning() async {
    while (mounted) {
      await Future.delayed(Duration(milliseconds: 400 + _random.nextInt(800)));
      _spawnHeart();
    }
  }

  void _spawnHeart() {
    final size = MediaQuery.of(context).size;
    final animationController = AnimationController(
      duration: Duration(seconds: 3 + _random.nextInt(2)),
      vsync: this,
    );

    final heart = _Heart(
      left: _random.nextDouble() * size.width,
      size: 20.0 + _random.nextDouble() * 20.0,
      animation: animationController,
    );

    animationController.forward().whenComplete(() {
      _hearts.remove(heart);
      animationController.dispose();
      if (mounted) setState(() {});
    });

    _hearts.add(heart);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Stack(
        children: _hearts.map((heart) {
          return AnimatedBuilder(
            animation: heart.animation,
            builder: (context, child) {
              final animationValue = heart.animation.value;
              return Positioned(
                top: animationValue * MediaQuery.of(context).size.height,
                left: heart.left,
                child: Opacity(
                  opacity: 1.0 - animationValue,
                  child: Icon(Icons.favorite, color: Colors.pinkAccent, size: heart.size),
                ),
              );
            },
          );
        }).toList(),
      ),
    );
  }
}

class _Heart {
  final double left;
  final double size;
  final Animation<double> animation;

  _Heart({required this.left, required this.size, required this.animation});
}
