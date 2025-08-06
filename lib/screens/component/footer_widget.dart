import 'package:flutter/material.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),

      child: Column(
        children: [
          isMobile
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [_FooterSection(), SizedBox(height: 32), _ContactSection()],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Expanded(child: _FooterSection()),
                    SizedBox(width: 80),
                    Expanded(child: _ContactSection()),
                  ],
                ),
          const SizedBox(height: 40),
          const Divider(),
          const SizedBox(height: 16),
          const Text(
            '© 2025 Bản quyền thuộc @ducit247',
            style: TextStyle(fontSize: 13, color: Colors.grey, fontStyle: FontStyle.italic),
          ),
        ],
      ),
    );
  }
}

class _FooterSection extends StatelessWidget {
  const _FooterSection();

  @override
  Widget build(BuildContext context) {
    final links = [
      'Chính sách sử dụng',
      'Chính sách đối tác',
      'Bảo mật thông tin',
      'Hướng dẫn sử dụng',
      'Liên hệ hỗ trợ',
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Chính sách & Hỗ trợ', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: links.map((title) => _FooterLink(title: title)).toList(),
        ),
      ],
    );
  }
}

class _FooterLink extends StatelessWidget {
  final String title;

  const _FooterLink({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () {},
          child: Text(
            title,
            style: const TextStyle(fontSize: 14, color: Colors.blueAccent, decoration: TextDecoration.underline),
          ),
        ),
      ),
    );
  }
}

class _ContactSection extends StatelessWidget {
  const _ContactSection();

  @override
  Widget build(BuildContext context) {
    final contactItems = [
      _ContactItem(icon: Icons.phone, text: '0909 999 999'),
      _ContactItem(icon: Icons.location_on, text: '123 Đường ABC, Quận 1, TP.HCM'),
      _ContactItem(icon: Icons.message, text: 'Zalo: zalo.me/ducit247'),
      _ContactItem(icon: Icons.facebook, text: 'facebook.com/ducit247'),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Liên hệ', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 16),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: contactItems),
      ],
    );
  }
}

class _ContactItem extends StatelessWidget {
  final IconData icon;
  final String text;

  const _ContactItem({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 18, color: Colors.grey[700]),
          const SizedBox(width: 10),
          Expanded(
            child: Text(text, style: const TextStyle(fontSize: 14, color: Colors.black87)),
          ),
        ],
      ),
    );
  }
}
