import 'package:depifinalproject/core/serviecs/single_ton_services/create_single_ton.dart';
import 'package:depifinalproject/feature/profile/pepesentation/manager/upload_image_profile/upload_image_profile_dart_cubit.dart';
import 'package:depifinalproject/feature/profile/pepesentation/views/widgets/profile_image_feild.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileImageWidget extends StatelessWidget {
  const ProfileImageWidget({
    super.key,
    required this.imageUrl,
    required this.onImageChange,
  });

  final String? imageUrl;

  final ValueChanged<String?> onImageChange;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<UploadProfileImageCubit>(),

      child: ProfileImageField(
        imageUrl: imageUrl,

        onImageChange: onImageChange,
      ),
    );
  }
}
