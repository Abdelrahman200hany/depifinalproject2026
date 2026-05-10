import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:depifinalproject/core/errors/servier_failure.dart';

abstract class ImageRepo {
  Future<Either<Failure, String>> uploadImage(File file);
  Future<Either<Failure, String>> updataIamge(
    File file, {
    required String oldImageUrl,
  });
}
