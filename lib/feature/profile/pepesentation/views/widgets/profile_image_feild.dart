import 'dart:io';

import 'package:depifinalproject/core/methods/pick_image_file.dart';
import 'package:depifinalproject/core/methods/show_snack_bar.dart';
import 'package:depifinalproject/feature/profile/pepesentation/manager/upload_image_profile/upload_image_profile_dart_cubit.dart';
import 'package:depifinalproject/feature/profile/pepesentation/manager/upload_image_profile/upload_image_profile_dart_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileImageField extends StatefulWidget {
  const ProfileImageField({
    super.key,
    this.imageUrl,
    required this.onImageChange,
  });

  final String? imageUrl;

  final ValueChanged<String?> onImageChange;

  @override
  State<ProfileImageField> createState() => _ProfileImageFieldState();
}

class _ProfileImageFieldState extends State<ProfileImageField> {
  File? pickedImage;

  String? currentImageUrl;

  @override
  void initState() {
    super.initState();

    currentImageUrl = widget.imageUrl;
  }

  Future<void> pickImage() async {
    final image = await ImagePickerHelper.pickImage();

    if (image != null) {
      setState(() {
        pickedImage = image;
      });

      context.read<UploadProfileImageCubit>().uploadProfileImage(
        imageFile: image,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UploadProfileImageCubit, UploadProfileImageState>(
      listener: (context, state) {
        if (state is UploadProfileImageSuccess) {
          currentImageUrl = state.imageUrl;

          widget.onImageChange(state.imageUrl);

          showSuccessSnackBar(context, message: 'تم تحديث الصورة بنجاح');

          setState(() {});
        }

        if (state is UploadProfileImageFailure) {
          showSuccessSnackBar(context, message: state.message);
        }
      },

      builder: (context, state) {
        bool loading = state is UploadProfileImageLoading;

        return Stack(
          alignment: Alignment.center,

          children: [
            GestureDetector(
              onTap: pickImage,

              child: Container(
                width: 130,

                height: 130,

                padding: const EdgeInsets.all(3),

                decoration: BoxDecoration(
                  shape: BoxShape.circle,

                  border: Border.all(color: Colors.blue, width: 3),
                ),

                child: ClipOval(
                  child: pickedImage != null
                      ? Image.file(pickedImage!, fit: BoxFit.cover)
                      : currentImageUrl != null
                      ? Image.network(currentImageUrl!, fit: BoxFit.cover)
                      : const Icon(Icons.person, size: 60),
                ),
              ),
            ),

            if (loading)
              const SizedBox(
                width: 45,

                height: 45,

                child: CircularProgressIndicator(),
              ),

            if (currentImageUrl != null || pickedImage != null)
              Positioned(
                right: 5,

                bottom: 5,

                child: CircleAvatar(
                  radius: 18,

                  backgroundColor: Colors.red,

                  child: IconButton(
                    padding: EdgeInsets.zero,

                    icon: const Icon(
                      Icons.close,

                      color: Colors.white,

                      size: 18,
                    ),

                    onPressed: () {
                      pickedImage = null;

                      currentImageUrl = null;

                      widget.onImageChange(null);

                      setState(() {});
                    },
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
