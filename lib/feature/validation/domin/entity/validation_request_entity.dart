import 'package:depifinalproject/core/consts/consts.dart';

class ValidationRequestEntity {
  final String frontIdImage;

  final String backIdImage;

  final String selfieImage;

  final String token;

  final String status;

  final String rejectedReason;

  ValidationRequestEntity({
    required this.frontIdImage,

    required this.backIdImage,

    required this.selfieImage,

    required this.token,

    this.status = kValidationWaiting,

    this.rejectedReason = "",
  });
}
