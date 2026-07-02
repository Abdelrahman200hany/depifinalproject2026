import 'package:dartz/dartz.dart';

import 'package:depifinalproject/core/errors/servier_failure.dart';

import 'package:depifinalproject/feature/validation/domin/entity/validation_request_entity.dart';

abstract class ValidationRequestRepo {
  Future<Either<Failure, void>> addValidationRequest(
    ValidationRequestEntity request,
  );

  Future<Either<Failure, ValidationRequestEntity>> getValidationRequest(
    String token,
  );

  Future<Either<Failure, List<ValidationRequestEntity>>>
  getWaitingValidationRequests();

  Future<Either<Failure, void>> updateValidationRequest({
    required String token,

    required Map<String, dynamic> data,
  });
}
