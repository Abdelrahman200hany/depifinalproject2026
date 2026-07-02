import 'package:depifinalproject/feature/validation/domin/use_case/get_waiting_validation_requests_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'get_waiting_validation_requests_state.dart';

class GetWaitingValidationRequestsCubit
    extends Cubit<GetWaitingValidationRequestsState> {
  final GetWaitingValidationRequestsUseCase useCase;

  GetWaitingValidationRequestsCubit(this.useCase)
    : super(GetWaitingValidationRequestsInitial());

  Future<void> getWaitingValidationRequests() async {
    emit(GetWaitingValidationRequestsLoading());

    final result = await useCase();

    result.fold(
      (failure) {
        emit(GetWaitingValidationRequestsFailure(failure.message));
      },

      (requests) {
        emit(GetWaitingValidationRequestsSuccess(requests));
      },
    );
  }
}
