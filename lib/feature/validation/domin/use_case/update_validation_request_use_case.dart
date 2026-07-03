import 'package:dartz/dartz.dart';

import 'package:depifinalproject/core/errors/servier_failure.dart';

import 'package:depifinalproject/feature/validation/domin/repo/validation_request_repo.dart';

class UpdateValidationRequestUseCase {
  final ValidationRequestRepo repo;

  UpdateValidationRequestUseCase(this.repo);

  Future<Either<Failure, void>> call({
    required String token,

    required Map<String, dynamic> data,
  }) async {
    return await repo.updateValidationRequest(token: token, data: data);
  }
}
