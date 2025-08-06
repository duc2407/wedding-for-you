import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:html' as html;

enum PaymentMethod { bankTransfer, momo }

class PaymentPages extends StatefulWidget {
  final String templateId;
  final int templatePrice;
  final String userName;

  const PaymentPages({super.key, required this.templateId, required this.templatePrice, required this.userName});

  @override
  State<PaymentPages> createState() => _PaymentPagesState();
}

class _PaymentPagesState extends State<PaymentPages> {
  PaymentMethod _selectedMethod = PaymentMethod.bankTransfer;
  void _downloadQr(String url, String fileName) {
    final anchor = html.AnchorElement(href: url)
      ..setAttribute('download', fileName)
      ..click();
  }

  bool showConfirmButton = false;
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        setState(() {
          showConfirmButton = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final String paymentContent = '${widget.userName} - ${widget.templateId}';
    final String accountNumber = '101872712364';
    final String bankName = 'vietinbank';
    final String vietQrUrl =
        'https://img.vietqr.io/image/$bankName-$accountNumber-compact.png?amount=${widget.templatePrice}&addInfo=$paymentContent';
    final String momoQrUrl = 'assets/images/momo.jpg';

    return Scaffold(
      appBar: AppBar(
        title: Text("Thanh toán mẫu ${widget.templateId}"),
        backgroundColor: Colors.pinkAccent,
        foregroundColor: Colors.white,
        elevation: 2,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isMobile = constraints.maxWidth < 700;

          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: isMobile ? 16 : 48, vertical: isMobile ? 16 : 32),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 700),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Số tiền cần thanh toán: ${widget.templatePrice}đ',
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'Chọn hình thức thanh toán:',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 10),

                    _buildPaymentOption(
                      method: PaymentMethod.bankTransfer,
                      title: 'Chuyển khoản ngân hàng',
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Divider(),
                          Text('Ngân hàng: $bankName', style: const TextStyle(fontSize: 16)),
                          _buildCopyRow(label: 'Số tài khoản:', value: accountNumber),
                          _buildCopyRow(label: 'Chủ tài khoản:', value: "NGUYEN MINH DUC"),
                          _buildCopyRow(label: 'Nội dung:', value: paymentContent),
                          const SizedBox(height: 12),
                          Center(child: Image.network(vietQrUrl, height: 180)),
                          const SizedBox(height: 6),
                          Center(
                            child: OutlinedButton.icon(
                              onPressed: () => _downloadQr(vietQrUrl, 'vietqr.png'),
                              icon: Icon(Icons.download, color: Colors.pinkAccent.shade100),
                              label: Text('Lưu mã QR', style: TextStyle(color: Colors.pinkAccent.shade100)),
                              style: OutlinedButton.styleFrom(
                                side: BorderSide(color: Colors.pinkAccent.shade100),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                                backgroundColor: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),

                    _buildPaymentOption(
                      method: PaymentMethod.momo,
                      title: 'Ví điện tử MoMo',
                      child: Column(
                        children: [
                          const Divider(),
                          _buildCopyRow(label: 'Số điện thoại:', value: "0395931862"),
                          _buildCopyRow(label: 'Nội dung:', value: paymentContent),
                          Center(child: Image.asset(momoQrUrl, height: 180)),
                          const SizedBox(height: 6),
                          Center(
                            child: OutlinedButton.icon(
                              onPressed: () => _downloadQr(momoQrUrl, 'wedding4u_momo.jpg'),
                              icon: Icon(Icons.download, color: Colors.pinkAccent.shade100),
                              label: Text('Lưu mã QR', style: TextStyle(color: Colors.pinkAccent.shade100)),
                              style: OutlinedButton.styleFrom(
                                side: BorderSide(color: Colors.pinkAccent.shade100),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                                backgroundColor: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    if (showConfirmButton)
                      Padding(
                        padding: const EdgeInsets.only(top: 24),
                        child: SizedBox(
                          width: double.infinity,
                          child: OutlinedButton.icon(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: const Text('Xác nhận thanh toán'),
                                  content: const Text('Bạn đã hoàn tất thanh toán?'),
                                  actions: [
                                    TextButton(child: const Text('Hủy'), onPressed: () => Navigator.pop(context)),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(backgroundColor: Colors.pinkAccent.shade100),
                                      child: const Text('Xác nhận'),
                                      onPressed: () {
                                        Navigator.pop(context);
                                        Navigator.pop(context);
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          const SnackBar(
                                            content: Text(
                                              'Cảm ơn bạn đã thanh toán. Mẫu sẽ được kích hoạt sau khi xác minh.',
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              );
                            },
                            icon: Icon(Icons.check_circle, color: Colors.pinkAccent.shade100),
                            label: Text(
                              'Tôi đã thanh toán',
                              style: TextStyle(color: Colors.pinkAccent.shade100, fontSize: 16),
                            ),
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(color: Colors.pinkAccent.shade100),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                              padding: const EdgeInsets.symmetric(vertical: 18),
                              backgroundColor: Colors.white,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildPaymentOption({required PaymentMethod method, required String title, required Widget child}) {
    final bool isSelected = _selectedMethod == method;

    return GestureDetector(
      onTap: () => setState(() => _selectedMethod = method),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: isSelected ? Colors.pink.shade50 : Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: isSelected ? Colors.pinkAccent : Colors.grey.shade300),
          boxShadow: [BoxShadow(color: Colors.grey.shade200, blurRadius: 6, offset: const Offset(0, 3))],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  isSelected ? Icons.radio_button_checked : Icons.radio_button_off,
                  color: isSelected ? Colors.pinkAccent : Colors.grey,
                ),
                const SizedBox(width: 10),
                Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
              ],
            ),
            if (isSelected) Padding(padding: const EdgeInsets.only(top: 12), child: child),
          ],
        ),
      ),
    );
  }

  Widget _buildCopyRow({required String label, required String value}) {
    return Row(
      children: [
        Expanded(child: Text('$label $value', style: const TextStyle(fontSize: 15))),
        IconButton(
          tooltip: 'Copy',
          icon: const Icon(Icons.copy, size: 15),
          onPressed: () {
            Clipboard.setData(ClipboardData(text: value));
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Đã copy: $label')));
          },
        ),
      ],
    );
  }
}
