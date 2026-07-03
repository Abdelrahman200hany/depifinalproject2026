import 'package:depifinalproject/feature/validation/presentation/manager/approve_validation_request/approve_validation_request_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:depifinalproject/feature/validation/domin/use_case/approve_validation_request_use_case.dart';

class ApproveValidationRequestCubit
    extends Cubit<ApproveValidationRequestState> {
  final ApproveValidationRequestUseCase useCase;

  ApproveValidationRequestCubit(this.useCase)
    : super(ApproveValidationRequestInitial());

  Future<void> approveValidationRequest({required String token}) async {
    emit(ApproveValidationRequestLoading());

    final result = await useCase(token: token);

    result.fold(
      (failure) {
        emit(ApproveValidationRequestFailure(failure.message));
      },

      (_) {
        emit(ApproveValidationRequestSuccess());
      },
    );
  }
}
