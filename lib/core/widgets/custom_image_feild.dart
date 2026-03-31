import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ImageFiled extends StatefulWidget {
  const ImageFiled({super.key, required this.onFileChang});
  final ValueChanged<File?> onFileChang;

  @override
  State<ImageFiled> createState() => _ImageFiledState();
}

class _ImageFiledState extends State<ImageFiled> {
  bool isLoading = false;
  File? fileImage;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Skeletonizer(
          enabled: isLoading,
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(36),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: Center(
              child: Center(
                child: IconButton(
                  onPressed: _pickImageFromGalary,
                  icon: fileImage == null
                      ? Icon(Icons.image_outlined, size: 120)
                      : Image.file(fileImage!, fit: BoxFit.scaleDown),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 10,
          left: 10,
          child: Visibility(
            visible: fileImage != null,
            child: IconButton(
              onPressed: () {
                fileImage = null;
                widget.onFileChang(fileImage);
                setState(() {});
              },
              icon: Icon(Icons.close_outlined, color: Colors.red, size: 24),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _pickImageFromGalary() async {
    isLoading = true;
    setState(() {});

    try {
      final ImagePicker picker = ImagePicker();

      final XFile? image = await picker.pickImage(source: ImageSource.gallery);

      fileImage = File(image!.path);
      widget.onFileChang(fileImage!);
    } catch (e) {
      isLoading = false;
      setState(() {});
    }
    isLoading = false;
    setState(() {});
  }
}
