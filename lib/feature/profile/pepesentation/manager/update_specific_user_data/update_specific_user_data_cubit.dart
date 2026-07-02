import 'package:depifinalproject/feature/profile/domain/use_case/update_specific_user_data_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'update_specific_user_data_state.dart';

class UpdateSpecificUserDataCubit extends Cubit<UpdateSpecificUserDataState> {
  final UpdateSpecificUserDataUseCase useCase;

  UpdateSpecificUserDataCubit(this.useCase)
    : super(UpdateSpecificUserDataInitial());

  Future<void> updateSpecificUserData({
    required String userId,

    required Map<String, dynamic> data,
  }) async {
    emit(UpdateSpecificUserDataLoading());

    final result = await useCase(userId: userId, data: data);

    result.fold(
      (failure) {
        emit(UpdateSpecificUserDataFailure(failure.message));
      },

      (_) {
        emit(UpdateSpecificUserDataSuccess());
      },
    );
  }
}
