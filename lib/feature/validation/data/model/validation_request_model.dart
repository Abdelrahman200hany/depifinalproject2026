import 'package:depifinalproject/core/consts/consts.dart';
import 'package:depifinalproject/feature/validation/domin/entity/validation_request_entity.dart';

class ValidationRequestModel extends ValidationRequestEntity {
  ValidationRequestModel({
    required super.frontIdImage,

    required super.backIdImage,

    required super.selfieImage,

    required super.token,

    super.status , 

    super.rejectedReason,
  });

  factory ValidationRequestModel.fromJson(Map<String, dynamic> json) {
    return ValidationRequestModel(
      frontIdImage: json['frontIdImage'] ?? '',

      backIdImage: json['backIdImage'] ?? '',

      selfieImage: json['selfieImage'] ?? '',

      token: json['token'] ?? '',

      status: json['status'] ?? kValidationWaiting,

      rejectedReason: json['rejectedReason'] ?? "",
    );
  }

  factory ValidationRequestModel.fromEntity(ValidationRequestEntity entity) {
    return ValidationRequestModel(
      frontIdImage: entity.frontIdImage,

      backIdImage: entity.backIdImage,

      selfieImage: entity.selfieImage,

      token: entity.token,

      status: entity.status,

      rejectedReason: entity.rejectedReason,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "frontIdImage": frontIdImage,

      "backIdImage": backIdImage,

      "selfieImage": selfieImage,

      "token": token,

      "status": status,

      "rejectedReason": rejectedReason,
    };
  }
}
