import 'package:dartz/dartz.dart';

import 'package:depifinalproject/core/errors/servier_failure.dart';

import 'package:depifinalproject/feature/validation/domin/entity/validation_request_entity.dart';
import 'package:depifinalproject/feature/validation/domin/repo/validation_request_repo.dart';

class GetWaitingValidationRequestsUseCase {
  final ValidationRequestRepo repo;

  GetWaitingValidationRequestsUseCase(this.repo);

  Future<Either<Failure, List<ValidationRequestEntity>>> call() async {
    return await repo.getWaitingValidationRequests();
  }
}
