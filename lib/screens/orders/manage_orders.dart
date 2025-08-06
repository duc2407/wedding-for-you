import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tailwind_colors/tailwind_colors.dart';
import 'package:url_launcher/url_launcher.dart';

class ManagerOrder extends StatefulWidget {
  const ManagerOrder({super.key});

  @override
  State<ManagerOrder> createState() => _ManagerOrderState();
}

class _ManagerOrderState extends State<ManagerOrder> {
  final List<Map<String, dynamic>> allOrders = List.generate(
    15,
    (i) => {
      'title': 'Thiệp cưới mẫu ${String.fromCharCode(65 + i)}',
      'image':
          'https://sdmntpraustraliaeast.oaiusercontent.com/files/00000000-df28-61fa-a34b-54f61d96d7f4/raw?se=2025-08-05T18%3A33%3A15Z&sp=r&sv=2024-08-04&sr=b&scid=ce60fa2e-b33d-57e1-9062-044dfc335167&skoid=b0fd38cc-3d33-418f-920e-4798de4acdd1&sktid=a48cca56-e6da-484e-a814-9c849652bcb3&skt=2025-08-05T12%3A39%3A36Z&ske=2025-08-06T12%3A39%3A36Z&sks=b&skv=2024-08-04&sig=9J8mlVM0Ql2HX5wxGfGHIibD/4O6hAL7uzoW/BDaubQ%3D',
      'status': i % 3 == 0
          ? 'Đã thanh toán'
          : i % 3 == 1
          ? 'Đang hoạt động'
          : 'Đã hết hạn',
      'link': 'https://wedding4u.online/${String.fromCharCode(97 + i)}',
    },
  );

  final int itemsPerPage = 5;
  int currentPage = 0;

  List<Map<String, dynamic>> get paginatedOrders {
    final start = currentPage * itemsPerPage;
    final end = (start + itemsPerPage) > allOrders.length ? allOrders.length : (start + itemsPerPage);
    return allOrders.sublist(start, end);
  }

  int get totalPages => (allOrders.length / itemsPerPage).ceil();

  Color _statusColor(String status) {
    switch (status) {
      case 'Đã thanh toán':
        return TWColors.blue.shade400;
      case 'Đang hoạt động':
        return TWColors.green.shade500;
      case 'Đã hết hạn':
        return TWColors.red.shade400;
      default:
        return Colors.grey;
    }
  }

  void _openLink(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Không thể mở liên kết')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TWColors.gray.shade50,
      appBar: AppBar(title: const Text("Thiệp đã mua"), backgroundColor: TWColors.pink.shade100, elevation: 0),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView.separated(
                itemCount: paginatedOrders.length,
                separatorBuilder: (_, __) => const SizedBox(height: 20),
                itemBuilder: (context, index) {
                  final order = paginatedOrders[index];
                  final statusColor = _statusColor(order['status']);

                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 4))],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                          child: Image.network(order['image'], width: double.infinity, height: 180, fit: BoxFit.cover),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                order['title'],
                                style: GoogleFonts.openSans(fontSize: 18, fontWeight: FontWeight.w700),
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                    decoration: BoxDecoration(
                                      color: statusColor.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Text(
                                      order['status'],
                                      style: GoogleFonts.openSans(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: statusColor,
                                      ),
                                    ),
                                  ),
                                  const Spacer(),
                                  if (order['status'] != 'Đã hết hạn')
                                    Row(
                                      children: [
                                        ElevatedButton(
                                          onPressed: () => _openLink(order['link']),
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: TWColors.purple.shade400,
                                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                          ),
                                          child: Text('Xem thiệp', style: GoogleFonts.openSans(color: Colors.white)),
                                        ),
                                        const SizedBox(width: 8),
                                        ElevatedButton(
                                          onPressed: () {},
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: TWColors.pink.shade400,
                                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                          ),
                                          child: Text('Chỉnh sửa', style: GoogleFonts.openSans(color: Colors.white)),
                                        ),
                                      ],
                                    )
                                  else
                                    ElevatedButton(
                                      onPressed: () => _openLink(order['link']),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: TWColors.gray.shade400,
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                      ),
                                      child: Text('Xem thiệp', style: GoogleFonts.openSans(color: Colors.white)),
                                    ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, -2))],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios_new, size: 18),
                  onPressed: currentPage > 0 ? () => setState(() => currentPage--) : null,
                  color: currentPage > 0 ? TWColors.pink.shade400 : Colors.grey,
                ),
                ...List.generate(totalPages, (i) {
                  final isActive = i == currentPage;
                  return GestureDetector(
                    onTap: () => setState(() => currentPage = i),
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: isActive ? TWColors.pink.shade400 : TWColors.gray.shade200,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        '${i + 1}',
                        style: GoogleFonts.openSans(
                          color: isActive ? Colors.white : Colors.black87,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  );
                }),
                IconButton(
                  icon: const Icon(Icons.arrow_forward_ios, size: 18),
                  onPressed: currentPage < totalPages - 1 ? () => setState(() => currentPage++) : null,
                  color: currentPage < totalPages - 1 ? TWColors.pink.shade400 : Colors.grey,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
