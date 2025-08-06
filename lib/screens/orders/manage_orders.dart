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

  int currentPage = 0;
  final int itemsPerPage = 6;

  List<Map<String, dynamic>> get paginatedOrders {
    final start = currentPage * itemsPerPage;
    final end = (start + itemsPerPage).clamp(0, allOrders.length);
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
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth > 600;

    return Scaffold(
      backgroundColor: TWColors.gray.shade50,
      appBar: AppBar(title: const Text("Thiệp đã mua"), backgroundColor: TWColors.pink.shade100, elevation: 0),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            children: [
              Expanded(
                child: isDesktop
                    ? GridView.builder(
                        itemCount: paginatedOrders.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: screenWidth > 1000 ? 3 : 2,
                          mainAxisSpacing: 16,
                          crossAxisSpacing: 16,
                          childAspectRatio: 3 / 4.5,
                        ),
                        itemBuilder: (context, index) {
                          return _buildOrderCard(paginatedOrders[index], isDesktop);
                        },
                      )
                    : ListView.separated(
                        itemCount: paginatedOrders.length,
                        separatorBuilder: (_, __) => const SizedBox(height: 16),
                        itemBuilder: (context, index) {
                          return _buildOrderCard(paginatedOrders[index], isDesktop);
                        },
                      ),
              ),
              if (totalPages > 1)
                Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: currentPage > 0 ? () => setState(() => currentPage--) : null,
                        icon: const Icon(Icons.chevron_left),
                      ),
                      Text('Trang ${currentPage + 1} / $totalPages'),
                      IconButton(
                        onPressed: currentPage < totalPages - 1 ? () => setState(() => currentPage++) : null,
                        icon: const Icon(Icons.chevron_right),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOrderCard(Map<String, dynamic> order, bool isDesktop) {
    final statusColor = _statusColor(order['status']);

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 4))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Ảnh
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: Image.network(
              order['image'],
              width: double.infinity,
              height: isDesktop ? 120 : 160,
              fit: BoxFit.cover,
            ),
          ),
          // Nội dung
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(order['title'], style: GoogleFonts.openSans(fontSize: 16, fontWeight: FontWeight.w600)),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: statusColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        order['status'],
                        style: GoogleFonts.openSans(fontSize: 13, fontWeight: FontWeight.w600, color: statusColor),
                      ),
                    ),
                    const Spacer(),
                    if (order['status'] != 'Đã hết hạn')
                      Row(
                        children: [
                          IconButton(
                            onPressed: () => _openLink(order['link']),
                            icon: const Icon(Icons.visibility),
                            tooltip: 'Xem thiệp',
                            color: TWColors.purple.shade400,
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.edit),
                            tooltip: 'Chỉnh sửa',
                            color: TWColors.pink.shade400,
                          ),
                        ],
                      )
                    else
                      IconButton(
                        onPressed: () => _openLink(order['link']),
                        icon: const Icon(Icons.visibility_off),
                        tooltip: 'Thiệp đã hết hạn',
                        color: TWColors.gray.shade400,
                      ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
