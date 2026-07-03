import 'package:depifinalproject/feature/profile/domain/use_case/update_user_data_use_case.dart';
import 'package:depifinalproject/feature/profile/pepesentation/manager/update_user_profile_data/update_user_data_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:depifinalproject/feature/auth/domain/entity/user_entity.dart';

class UpdateUserCubit extends Cubit<UpdateUserState> {
  final UpdateUserDataUseCase updateUserDataUseCase;

  UpdateUserCubit(this.updateUserDataUseCase) : super(UpdateUserInitial());

  UserEntity? user;

  Future<void> updateUser({required UserEntity updatedUser}) async {
    emit(UpdateUserLoading());

    final result = await updateUserDataUseCase(user: updatedUser);

    result.fold(
      (failure) {
        emit(UpdateUserFailure(message: failure.message));
      },

      (_) {
        user = updatedUser;

        emit(UpdateUserSuccess(user: updatedUser));
      },
    );
  }
}
