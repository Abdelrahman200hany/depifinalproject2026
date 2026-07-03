import 'dart:io';

import 'package:depifinalproject/core/methods/pick_image_file.dart';
import 'package:depifinalproject/core/methods/show_snack_bar.dart';
import 'package:depifinalproject/core/utils/app_backend_endpoints.dart';
import 'package:depifinalproject/feature/profile/pepesentation/manager/upload_image_profile/upload_image_profile_dart_cubit.dart';
import 'package:depifinalproject/feature/profile/pepesentation/manager/upload_image_profile/upload_image_profile_dart_state.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomUploadValidationImageField extends StatefulWidget {
  const CustomUploadValidationImageField({
    super.key,
    required this.placeholderImage,
    this.imageUrl,
    required this.onImageUploaded,
  });

  final String placeholderImage;

  final String? imageUrl;

  final ValueChanged<String?> onImageUploaded;

  @override
  State<CustomUploadValidationImageField> createState() =>
      _CustomUploadValidationImageFieldState();
}

class _CustomUploadValidationImageFieldState
    extends State<CustomUploadValidationImageField> {
  File? pickedImage;

  String? currentImageUrl;

  @override
  void initState() {
    super.initState();

    currentImageUrl = widget.imageUrl;
  }

  Future<void> pickImage() async {
    final image = await ImagePickerHelper.pickImage();

    if (image == null) return;

    setState(() {
      pickedImage = image;
    });

    context.read<UploadProfileImageCubit>().uploadProfileImage(
      collectionName: AppBackendEndpoints.validationImageCollection,

      imageFile: image,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UploadProfileImageCubit, UploadProfileImageState>(
      listener: (context, state) {
        if (state is UploadProfileImageSuccess) {
          currentImageUrl = state.imageUrl;

          widget.onImageUploaded(state.imageUrl);

          setState(() {});
        }

        if (state is UploadProfileImageFailure) {
          showSuccessSnackBar(context, message: state.message);
        }
      },

      builder: (context, state) {
        final loading = state is UploadProfileImageLoading;

        return GestureDetector(
          onTap: loading ? null : pickImage,

          child: Stack(
            alignment: Alignment.center,

            children: [
              pickedImage != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(20),

                      child: Image.file(
                        pickedImage!,

                        fit: BoxFit.cover,

                        width: double.infinity,

                        height: 250,
                      ),
                    )
                  : currentImageUrl != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(20),

                      child: Image.network(
                        currentImageUrl!,

                        fit: BoxFit.cover,

                        width: double.infinity,

                        height: 250,
                      ),
                    )
                  : Image.asset(
                      widget.placeholderImage,

                      fit: BoxFit.contain,

                      width: double.infinity,

                      height: 250,
                    ),

              if (loading) const CircularProgressIndicator(),
            ],
          ),
        );
      },
    );
  }
}
// import 'dart:io';

// import 'package:depifinalproject/core/methods/pick_image_file.dart';
// import 'package:depifinalproject/core/methods/show_snack_bar.dart';
// import 'package:depifinalproject/core/utils/app_backend_endpoints.dart';
// import 'package:depifinalproject/feature/profile/pepesentation/manager/upload_image_profile/upload_image_profile_dart_cubit.dart';
// import 'package:depifinalproject/feature/profile/pepesentation/manager/upload_image_profile/upload_image_profile_dart_state.dart';

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class CustomUploadValidationImageField extends StatefulWidget {
//   const CustomUploadValidationImageField({
//     super.key,

//     required this.placeholderImage,

//     this.imageUrl,

//     required this.onImageUploaded,
//   });

//   final String placeholderImage;

//   final String? imageUrl;

//   final ValueChanged<String?> onImageUploaded;

//   @override
//   State<CustomUploadValidationImageField> createState() =>
//       _CustomUploadValidationImageFieldState();
// }

// class _CustomUploadValidationImageFieldState
//     extends State<CustomUploadValidationImageField> {
//   File? pickedImage;

//   String? currentImageUrl;

//   @override
//   void initState() {
//     super.initState();

//     currentImageUrl = widget.imageUrl;
//   }

//   Future<void> pickImage() async {
//     final image = await ImagePickerHelper.pickImage();

//     if (image == null) return;

//     setState(() {
//       pickedImage = image;
//     });

//     context.read<UploadProfileImageCubit>().uploadProfileImage(
//       collectionName: AppBackendEndpoints.validationImageCollection,

//       imageFile: image,
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<UploadProfileImageCubit, UploadProfileImageState>(
//       listener: (context, state) {
//         if (state is UploadProfileImageSuccess) {
//           currentImageUrl = state.imageUrl;

//           widget.onImageUploaded(state.imageUrl);

//           setState(() {});
//         }

//         if (state is UploadProfileImageFailure) {
//           showSuccessSnackBar(context, message: state.message);
//         }
//       },

//       builder: (context, state) {
//         bool loading = state is UploadProfileImageLoading;

//         return GestureDetector(
//           onTap: loading ? null : pickImage,

//           child: Container(
//             height: 220,

//             width: double.infinity,

//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(20),

//               border: Border.all(color: Colors.grey),
//             ),

//             child: Stack(
//               alignment: Alignment.center,

//               children: [
//                 pickedImage != null
//                     ? Image.file(
//                         pickedImage!,

//                         fit: BoxFit.cover,

//                         width: double.infinity,
//                       )
//                     : currentImageUrl != null
//                     ? Image.network(
//                         currentImageUrl!,

//                         fit: BoxFit.cover,

//                         width: double.infinity,
//                       )
//                     : Image.asset(
//                         widget.placeholderImage,

//                         fit: BoxFit.cover,

//                         width: double.infinity,
//                       ),

//                 if (loading) const CircularProgressIndicator(),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
