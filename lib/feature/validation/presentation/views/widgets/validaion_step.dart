
import 'package:depifinalproject/feature/validation/presentation/views/widgets/custom_upload_validation_image_widget_bloc_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ValidationStep extends StatelessWidget {
  const ValidationStep({
    super.key,

    required this.image,

    required this.title,

    required this.description,

    required this.uploadedImage,

    required this.onUploaded,
  });

  final String image;

  final String title;

  final String description;

  final String? uploadedImage;

  final ValueChanged<String?> onUploaded;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          CustomUploadValidationImageWidget(
            placeholderImage: image,

            imageUrl: uploadedImage,

            onImageUploaded: onUploaded,
          ),

          const SizedBox(height: 30),

          Text(
            title,

            textAlign: TextAlign.center,

            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 15),

          Text(
            description,

            textAlign: TextAlign.center,

            style: const TextStyle(color: Colors.grey, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
