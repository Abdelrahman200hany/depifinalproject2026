import 'package:dartz/dartz.dart';
import 'package:depifinalproject/core/consts/consts.dart';

import 'package:depifinalproject/core/errors/servier_failure.dart';
import 'package:depifinalproject/feature/profile/domain/use_case/update_specific_user_data_use_case.dart';
import 'package:depifinalproject/feature/validation/domin/use_case/update_validation_request_use_case.dart';

class ApproveValidationRequestUseCase {
  final UpdateValidationRequestUseCase updateValidationRequestUseCase;

  final UpdateSpecificUserDataUseCase updateSpecificUserDataUseCase;

  ApproveValidationRequestUseCase(
    this.updateValidationRequestUseCase,

    this.updateSpecificUserDataUseCase,
  );

  Future<Either<Failure, void>> call({required String token}) async {
    try {
      await updateValidationRequestUseCase(
        token: token,

        data: {"status": kValidationApproved},
      );

      await updateSpecificUserDataUseCase(
        userId: token,

        data: {"isValided": true},
      );

      return right(null);
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }
}
