import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:depifinalproject/core/errors/servier_failure.dart';
import 'package:depifinalproject/core/repo/images_repo/image_repo.dart';
import 'package:depifinalproject/core/serviecs/storage_services.dart/storage_servies.dart';
import 'package:depifinalproject/core/utils/app_backend_endpoints.dart';

class ImageRepoImplemetation implements ImageRepo {
  final StorageServiecs sB;

  ImageRepoImplemetation(this.sB);
  @override
  Future<Either<Failure, String>> uploadImage(File file) async {
    try {
      String imageUrl = await sB.upLoadFile(
        file,
        AppBackendEndpoints.orderImagesfile,
      );
      return right(imageUrl);
    } catch (e) {
      log('the expetion in uploaded image repo impltattion is : $e');

      return left(
        ServerFailure(
          message:
              'حدث خطأ غير متوقع أثناء رفع الصورة. يرجى المحاولة مرة أخرى. ',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, String>> updataIamge(
    File file, {
    required String oldImageUrl,
  }) async {
    try {
      String imageUrl = await sB.upDateFile(file, oldImageUrl);
      return right(imageUrl);
    } catch (e) {
      return left(
        ServerFailure(
          message:
              'حدث خطأ غير متوقع أثناء تحديث الصورة. يرجى المحاولة مرة أخرى. ',
        ),
      );
    }
  }
}
