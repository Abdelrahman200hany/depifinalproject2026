import 'package:depifinalproject/feature/auth/domain/use_casse/refrech_user_data_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'refresh_user_data_state.dart';

class RefreshUserDataCubit extends Cubit<RefreshUserDataState> {
  final RefreshUserDataUseCase refreshUserDataUseCase;

  RefreshUserDataCubit(this.refreshUserDataUseCase)
    : super(RefreshUserDataInitial());

  Future<void> refreshUserData({required String userId}) async {
    emit(RefreshUserDataLoading());

    final result = await refreshUserDataUseCase(userId: userId);

    result.fold(
      (failure) => emit(RefreshUserDataFailure(failure.message)),
      (_) => emit(RefreshUserDataSuccess()),
    );
  }
}
