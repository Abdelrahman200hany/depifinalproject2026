import 'dart:io';

import 'package:depifinalproject/core/utils/app_backend_endpoints.dart';
import 'package:depifinalproject/feature/profile/pepesentation/manager/upload_image_profile/upload_image_profile_dart_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:depifinalproject/feature/profile/domain/use_case/upload_profile_image_use_case.dart';

class UploadProfileImageCubit extends Cubit<UploadProfileImageState> {
  final UploadProfileImageUseCase uploadProfileImageUseCase;

  UploadProfileImageCubit(this.uploadProfileImageUseCase)
    : super(UploadProfileImageInitial());

  Future<void> uploadProfileImage({
    required File imageFile,
    String collectionName = AppBackendEndpoints.profileImageCollection,
  }) async {
    emit(UploadProfileImageLoading());

    final result = await uploadProfileImageUseCase.excute(
      imagefile: imageFile,
      collectionName: collectionName,
    );

    result.fold(
      (failure) {
        emit(UploadProfileImageFailure(message: failure.message));
      },

      (imageUrl) {
        emit(UploadProfileImageSuccess(imageUrl: imageUrl));
      },
    );
  }
}
