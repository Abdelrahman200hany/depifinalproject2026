import 'package:depifinalproject/feature/validation/domin/use_case/add_validation_request_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:depifinalproject/feature/validation/domin/entity/validation_request_entity.dart';

import 'add_validation_request_state.dart';

class AddValidationRequestCubit extends Cubit<AddValidationRequestState> {
  final AddValidationRequestUseCase useCase;

  AddValidationRequestCubit(this.useCase)
    : super(AddValidationRequestInitial());

  Future<void> addValidationRequest(ValidationRequestEntity request) async {
    emit(AddValidationRequestLoading());

    final result = await useCase(request);

    result.fold(
      (failure) {
        emit(AddValidationRequestFailure(failure.message));
      },

      (data) {
        emit(AddValidationRequestSuccess());
      },
    );
  }
}
