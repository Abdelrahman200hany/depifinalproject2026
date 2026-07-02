import 'package:dartz/dartz.dart';

import 'package:depifinalproject/core/errors/servier_failure.dart';

import 'package:depifinalproject/feature/validation/domin/entity/validation_request_entity.dart';
import 'package:depifinalproject/feature/validation/domin/repo/validation_request_repo.dart';

class GetValidationRequestUseCase {
  final ValidationRequestRepo repo;

  GetValidationRequestUseCase(this.repo);

  Future<Either<Failure, ValidationRequestEntity>> call(String token) async {
    return await repo.getValidationRequest(token);
  }
}
