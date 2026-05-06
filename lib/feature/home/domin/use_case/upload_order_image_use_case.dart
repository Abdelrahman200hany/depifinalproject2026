import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:depifinalproject/core/errors/servier_failure.dart';
import 'package:depifinalproject/core/repo/image_upload/image_uploaded_repo.dart';

class UploadOrderImageUseCase {
  final ImageUploadedRepo imageUploadedRepo;

  UploadOrderImageUseCase(this.imageUploadedRepo);

  Future<Either<Failure, String>> excute({required File imagefile}) async {
    return await imageUploadedRepo.uploadImage(imagefile);
  }
}
