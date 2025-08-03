import 'dart:async';
import 'package:flutter/material.dart';

class StepSliderEffect extends StatefulWidget {
  const StepSliderEffect({super.key});

  @override
  State<StepSliderEffect> createState() => _StepSliderEffectState();
}

class _StepSliderEffectState extends State<StepSliderEffect> {
  int currentStep = 0;
  late Timer timer;

  final steps = [
    {'icon': Icons.image, 'label': 'Chọn mẫu'},
    {'icon': Icons.edit, 'label': 'Điền thông tin'},
    {'icon': Icons.link, 'label': 'Nhận link'},
  ];

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      setState(() {
        currentStep = (currentStep + 1) % steps.length;
      });
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  Widget _buildStep(int index, IconData icon, String label, bool isActive) {
    return Column(
      children: [
        Text(
          'Bước ${index + 1}',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: isActive ? Colors.pink : Colors.grey.shade600,
          ),
        ),
        const SizedBox(height: 6),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: isActive ? Colors.pink.withOpacity(0.3) : Colors.grey.withOpacity(0.1),
                blurRadius: 10,
                spreadRadius: 2,
                offset: const Offset(2, 4),
              ),
            ],
          ),
          child: Icon(icon, size: 22, color: isActive ? Colors.pink : Colors.grey.shade500),
        ),
        const SizedBox(height: 6),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
            color: isActive ? Colors.pink : Colors.grey.shade700,
          ),
        ),
      ],
    );
  }

  Widget _buildDivider(bool isActive) {
    return Container(
      width: 36,
      height: 4,
      margin: const EdgeInsets.symmetric(horizontal: 6),
      decoration: BoxDecoration(
        color: isActive ? Colors.pink.shade300 : Colors.grey.shade300,
        borderRadius: BorderRadius.circular(4),
        boxShadow: [
          if (isActive) BoxShadow(color: Colors.pink.withOpacity(0.3), blurRadius: 6, offset: const Offset(0, 2)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final items = <Widget>[];

    for (int i = 0; i < steps.length; i++) {
      items.add(_buildStep(i, steps[i]['icon'] as IconData, steps[i]['label'] as String, i == currentStep));
      if (i < steps.length - 1) {
        items.add(_buildDivider(currentStep == i || currentStep == i + 1));
      }
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
      child: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(mainAxisSize: MainAxisSize.min, children: items),
        ),
      ),
    );
  }
}
