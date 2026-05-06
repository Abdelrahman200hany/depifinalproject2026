

import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:depifinalproject/core/errors/servier_failure.dart';

abstract class ImageUploadedRepo {
  Future<Either<Failure, String>> uploadImage(File file,);
}
