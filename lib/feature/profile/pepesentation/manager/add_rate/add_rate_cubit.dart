import 'package:depifinalproject/feature/profile/pepesentation/manager/add_rate/add_rate_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:depifinalproject/feature/profile/domain/entity/rate_entity.dart';
import 'package:depifinalproject/feature/profile/domain/use_case/add_rate_use_case.dart';

class AddRateCubit extends Cubit<AddRateState> {
  final AddRateUseCase addRateUseCase;

  AddRateCubit(this.addRateUseCase) : super(AddRateInitial());

  Future<void> addRate({
    required String targetUserId,

    required RateEntity rate,
  }) async {
    emit(AddRateLoading());

    final result = await addRateUseCase.execute(
      targetUserId: targetUserId,

      rate: rate,
    );

    result.fold(
      (failure) {
        emit(AddRateFailure(failure.message));
      },

      (_) {
        emit(AddRateSuccess());
      },
    );
  }
}
