import 'package:dartz/dartz.dart';

import 'package:depifinalproject/core/errors/servier_failure.dart';

import 'package:depifinalproject/feature/validation/domin/entity/validation_request_entity.dart';
import 'package:depifinalproject/feature/validation/domin/repo/validation_request_repo.dart';

class AddValidationRequestUseCase {
  final ValidationRequestRepo repo;

  AddValidationRequestUseCase(this.repo);

  Future<Either<Failure, void>> call(ValidationRequestEntity request) async {
    return await repo.addValidationRequest(request);
  }
}
