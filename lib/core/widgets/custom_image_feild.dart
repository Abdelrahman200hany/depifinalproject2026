import 'dart:io';

import 'package:depifinalproject/core/utils/app_color.dart';
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
          child: GestureDetector(
            onTap: _pickImageFromGalary,
            child: Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: fileImage == null
                  ? Center(
                      child: Icon(
                        Icons.file_upload_outlined,
                        size: 120,
                        color: AppColor.kPrimaryColor.withValues(alpha: 0.5),
                      ),
                    )
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.file(
                        fileImage!,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
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

      // fileImage = File(image!.path);
      // widget.onFileChang(fileImage!);
      if (image != null) {
        fileImage = File(image.path);
        widget.onFileChang(fileImage);
      }
    } catch (e) {
      isLoading = false;
      setState(() {});
    }
    isLoading = false;
    setState(() {});
  }
}
