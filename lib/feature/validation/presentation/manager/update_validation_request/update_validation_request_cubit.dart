import 'package:depifinalproject/feature/validation/domin/use_case/update_validation_request_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'update_validation_request_state.dart';

class UpdateValidationRequestCubit extends Cubit<UpdateValidationRequestState> {
  final UpdateValidationRequestUseCase useCase;

  UpdateValidationRequestCubit(this.useCase)
    : super(UpdateValidationRequestInitial());

  Future<void> updateValidationRequest({
    required String token,

    required Map<String, dynamic> data,
  }) async {
    emit(UpdateValidationRequestLoading());

    final result = await useCase(token: token, data: data);

    result.fold(
      (failure) {
        emit(UpdateValidationRequestFailure(failure.message));
      },

      (_) {
        emit(UpdateValidationRequestSuccess());
      },
    );
  }
}
