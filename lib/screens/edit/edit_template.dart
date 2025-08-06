import 'dart:io';
// ignore: deprecated_member_use
import 'dart:html' as html;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EditTemplate extends StatefulWidget {
  const EditTemplate({super.key});

  @override
  State<EditTemplate> createState() => _EditTemplateState();
}

class _EditTemplateState extends State<EditTemplate> {
  final _formKey = GlobalKey<FormState>();
  final Map<String, String> formData = {};
  final List<XFile?> selectedImages = List.filled(10, null);
  final List<Uint8List?> webSelectedImages = List.filled(10, null);
  final List<String> sampleImages = List.generate(10, (index) => 'assets/images/logo.png');

  int currentStep = 0;

  Future<void> _pickImage(int index) async {
    if (kIsWeb) {
      final uploadInput = html.FileUploadInputElement()..accept = 'image/*';
      uploadInput.click();
      uploadInput.onChange.listen((event) {
        final file = uploadInput.files?.first;
        final reader = html.FileReader();

        reader.readAsArrayBuffer(file!);
        reader.onLoadEnd.listen((event) {
          setState(() {
            webSelectedImages[index] = reader.result as Uint8List;
          });
        });
      });
    } else {
      final picker = ImagePicker();
      final image = await picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        setState(() {
          selectedImages[index] = image;
        });
      }
    }
  }

  void _removeImage(int index) {
    setState(() {
      selectedImages[index] = null;
      webSelectedImages[index] = null;
    });
  }

  Widget _buildTextField(String label, String key) {
    return SizedBox(
      width: 300,
      child: TextFormField(
        decoration: InputDecoration(labelText: label, border: const OutlineInputBorder()),
        onSaved: (value) => formData[key] = value ?? '',
      ),
    );
  }

  Widget _buildImagePickerWithSample(int index) {
    final preview = kIsWeb ? webSelectedImages[index] : selectedImages[index];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('Ảnh vị trí ${index + 1}', style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(sampleImages[index], width: 100, height: 100, fit: BoxFit.cover),
            const SizedBox(width: 12),
            Stack(
              children: [
                GestureDetector(
                  onTap: () => _pickImage(index),
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: preview != null
                        ? (kIsWeb
                              ? Image.memory(preview as Uint8List, fit: BoxFit.cover)
                              : Image.file(File((preview as XFile).path), fit: BoxFit.cover))
                        : const Center(child: Icon(Icons.add_photo_alternate)),
                  ),
                ),
                if (preview != null)
                  Positioned(
                    top: 0,
                    right: 0,
                    child: IconButton(
                      icon: const Icon(Icons.close, size: 18, color: Colors.red),
                      onPressed: () => _removeImage(index),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Scaffold(
      appBar: AppBar(title: const Text('Chỉnh sửa thiệp cưới'), backgroundColor: Colors.pinkAccent),
      body: Column(
        children: [
          Expanded(
            child: Stepper(
              type: StepperType.horizontal,
              currentStep: currentStep,
              onStepContinue: () {
                if (currentStep == 0) {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    setState(() => currentStep++);
                  }
                } else {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(const SnackBar(content: Text('Đã lưu dữ liệu thành công!')));
                }
              },
              onStepCancel: () {
                if (currentStep > 0) {
                  setState(() => currentStep--);
                }
              },
              controlsBuilder: (context, details) {
                return const SizedBox.shrink();
              },
              steps: [
                Step(
                  title: const Text('Thông tin'),
                  isActive: currentStep >= 0,
                  content: Form(
                    key: _formKey,
                    child: Wrap(
                      spacing: 16,
                      runSpacing: 16,
                      alignment: WrapAlignment.center,
                      children: [
                        _buildTextField('Tên chú rể', 'groomName'),
                        _buildTextField('Tên cô dâu', 'brideName'),
                        _buildTextField('Cha mẹ chú rể', 'groomParents'),
                        _buildTextField('Cha mẹ cô dâu', 'brideParents'),
                        _buildTextField('Ngày cưới', 'weddingDate'),
                        _buildTextField('STK nhà trai', 'groomBank'),
                        _buildTextField('STK nhà gái', 'brideBank'),
                        _buildTextField('Địa điểm nhà trai', 'groomLocation'),
                        _buildTextField('Địa điểm nhà gái', 'brideLocation'),
                      ],
                    ),
                  ),
                ),
                Step(
                  title: const Text('Hình ảnh'),
                  isActive: currentStep >= 1,
                  content: LayoutBuilder(
                    builder: (context, constraints) {
                      return SingleChildScrollView(
                        child: Wrap(
                          spacing: 24,
                          runSpacing: 24,
                          alignment: WrapAlignment.center,
                          children: List.generate(10, (index) => _buildImagePickerWithSample(index)),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.pinkAccent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (currentStep > 0)
                  ElevatedButton(
                    onPressed: () => setState(() => currentStep--),
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                    child: const Text('Quay lại', style: TextStyle(color: Colors.pinkAccent)),
                  ),
                ElevatedButton(
                  onPressed: () {
                    if (currentStep == 0) {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        setState(() => currentStep++);
                      }
                    } else {
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(const SnackBar(content: Text('Đã lưu dữ liệu thành công!')));
                    }
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                  child: Text(currentStep == 0 ? 'Tiếp tục' : 'Lưu', style: const TextStyle(color: Colors.pinkAccent)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
