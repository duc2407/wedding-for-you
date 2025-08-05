import 'package:flutter/material.dart';

class RatingBox extends StatefulWidget {
  const RatingBox({super.key});

  @override
  State<RatingBox> createState() => _RatingBoxState();
}

class _RatingBoxState extends State<RatingBox> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, String>> _ratings = [];

  void _submitRating() {
    final text = _controller.text.trim();
    if (text.isEmpty) return;

    // ✅ Tắt bàn phím
    FocusScope.of(context).unfocus();

    setState(() {
      _ratings.add({
        'name': 'Nguyễn Văn A',
        'avatar': 'https://i.pravatar.cc/150?img=3', // random avatar
        'comment': text,
      });
      _controller.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Đánh giá:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(hintText: 'Nhập đánh giá của bạn...', border: InputBorder.none),
                    minLines: 1,
                    maxLines: 3,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              SizedBox(
                height: 48,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pinkAccent,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    elevation: 2,
                  ),
                  onPressed: _submitRating,
                  icon: const Icon(Icons.send, size: 18),
                  label: const Text('Gửi', style: TextStyle(fontSize: 14)),
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),
          ..._ratings.map(
            (r) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                children: [
                  CircleAvatar(backgroundImage: NetworkImage(r['avatar']!), radius: 20),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(r['name']!, style: const TextStyle(fontWeight: FontWeight.bold)),
                        const SizedBox(height: 4),
                        Text(r['comment']!),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
