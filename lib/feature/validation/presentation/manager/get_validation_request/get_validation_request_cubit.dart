import 'package:depifinalproject/feature/validation/domin/use_case/get_validation_request_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import 'get_validation_request_state.dart';

class GetValidationRequestCubit extends Cubit<GetValidationRequestState> {
  final GetValidationRequestUseCase useCase;

  GetValidationRequestCubit(this.useCase)
    : super(GetValidationRequestInitial());

  Future<void> getValidationRequest(String token) async {
    emit(GetValidationRequestLoading());

    final result = await useCase(token);

    result.fold(
      (failure) {
        emit(GetValidationRequestFailure(failure.message));
      },

      (request) {
        emit(GetValidationRequestSuccess(request));
      },
    );
  }
}
