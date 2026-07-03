import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:depifinalproject/core/errors/servier_failure.dart';
import 'package:depifinalproject/core/repo/images_repo/image_repo.dart';

class UpDataOrderImageByClinetUseCase {
  final ImageRepo imageRepo;

  UpDataOrderImageByClinetUseCase(this.imageRepo);

  Future<Either<Failure, String>> excute({
    required File file,
    required String oldImageUrl,
  }) async {
    return await imageRepo.updataIamge(file, oldImageUrl: oldImageUrl);
  }
}
