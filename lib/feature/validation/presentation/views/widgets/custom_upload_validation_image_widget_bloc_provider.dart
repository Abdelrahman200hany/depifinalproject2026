import 'package:depifinalproject/core/serviecs/single_ton_services/create_single_ton.dart';
import 'package:depifinalproject/feature/profile/pepesentation/manager/upload_image_profile/upload_image_profile_dart_cubit.dart';
import 'package:depifinalproject/feature/validation/presentation/views/widgets/custom_upload_validation_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomUploadValidationImageWidget extends StatelessWidget {
  const CustomUploadValidationImageWidget({
    super.key,

    required this.placeholderImage,

    this.imageUrl,

    required this.onImageUploaded,
  });

  final String placeholderImage;

  final String? imageUrl;

  final ValueChanged<String?> onImageUploaded;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<UploadProfileImageCubit>(),

      child: CustomUploadValidationImageField(
        placeholderImage: placeholderImage,

        imageUrl: imageUrl,

        onImageUploaded: onImageUploaded,
      ),
    );
  }
}
