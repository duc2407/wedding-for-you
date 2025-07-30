import 'package:flutter/material.dart';
import 'package:tailwind_colors/tailwind_colors.dart';
import 'package:url_launcher/url_launcher.dart';

class FloatingContactButton extends StatefulWidget {
  const FloatingContactButton({super.key});

  @override
  State<FloatingContactButton> createState() => _FloatingContactButtonState();
}

class _FloatingContactButtonState extends State<FloatingContactButton> with SingleTickerProviderStateMixin {
  bool _expanded = false;
  late AnimationController _pulseController;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(vsync: this, duration: const Duration(seconds: 5))..repeat(reverse: true);
  }

  @override
  void dispose() {
    _pulseController.dispose();
    super.dispose();
  }

  void _toggleMenu() {
    setState(() => _expanded = !_expanded);
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 16,
      bottom: 16,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (_expanded) ...[
            _buildMiniButton(Icons.phone, 'tel:0395031862', const Color.fromARGB(255, 38, 82, 39)),
            const SizedBox(height: 8),
            _buildMiniButton(Icons.facebook, 'https://facebook.com/duc2407', Colors.blue),
            const SizedBox(height: 8),
            _buildMiniButton(Icons.chat, 'https://zalo.me/0395031862', Colors.blue),
            const SizedBox(height: 12),
          ],
          ScaleTransition(
            scale: Tween(
              begin: 0.6,
              end: 1.1,
            ).animate(CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut)),
            child: FloatingActionButton(
              onPressed: _toggleMenu,
              backgroundColor: TWColors.pink.shade400,
              child: Icon(_expanded ? Icons.people : Icons.chat),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMiniButton(IconData icon, String url, Color colorIcons) {
    return GestureDetector(
      onTap: () => _launchURL(url),
      child: CircleAvatar(
        radius: 24,
        backgroundColor: TWColors.pink.shade200,
        child: Icon(icon, color: colorIcons ?? Colors.white),
      ),
    );
  }

  void _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Không mở được liên kết")));
    }
  }
}
