import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:depifinalproject/core/errors/servier_failure.dart';
import 'package:depifinalproject/core/repo/images_repo/image_repo.dart';

class UploadProfileImageUseCase {
  final ImageRepo imageRepo;

  UploadProfileImageUseCase(this.imageRepo);

  Future<Either<Failure, String>> excute({
    required File imagefile,
    required String collectionName,
  }) async {
    return await imageRepo.uploadImage(
      imagefile,
      collectionName: collectionName,
    );
  }
}
