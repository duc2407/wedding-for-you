import 'package:flutter/material.dart';

class CrossFadeText extends StatefulWidget {
  final List<String> texts;
  final TextStyle style;
  final Duration duration;
  final Duration pause;

  const CrossFadeText({
    super.key,
    required this.texts,
    required this.style,
    this.duration = const Duration(milliseconds: 1500),
    this.pause = const Duration(seconds: 1),
  });

  @override
  _CrossFadeTextState createState() => _CrossFadeTextState();
}

class _CrossFadeTextState extends State<CrossFadeText>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);

    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);

    _controller.forward();

    _controller.addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        await Future.delayed(widget.pause);
        setState(() {
          _currentIndex = (_currentIndex + 1) % widget.texts.length;
        });
        _controller.reset();
        _controller.forward();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final nextIndex = (_currentIndex + 1) % widget.texts.length;

    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        FadeTransition(
          opacity: ReverseAnimation(_animation),
          child: Text(widget.texts[_currentIndex], style: widget.style),
        ),
        FadeTransition(
          opacity: _animation,
          child: Text(widget.texts[nextIndex], style: widget.style),
        ),
      ],
    );
  }
}
