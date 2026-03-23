import 'package:bloc/bloc.dart';
import 'package:depifinalproject/feature/auth/domain/entity/user_entity.dart';
import 'package:depifinalproject/feature/auth/domain/repo/auth_repo.dart';
import 'package:meta/meta.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this.authRepo) : super(SignUpInitial());
  final AuthRepo authRepo;

  Future<void> signUp({required UserEntity user}) async {
    emit(SignUpLoading());
    var result = await authRepo.signUpWithEmailAndPassword(
      email: user.email,
      password: user.password!,
      phoneNumber: user.phoneNumber,
      userType: user.userType,
      userCity: user.userCity,
      name: user.name,
    );
    result.fold(
      (faulire) {
        emit(SignUpFaulire(errorMessage: faulire.message));
      },
      (user) {
        emit(SignUpSuccess(user: user));
      },
    );
  }
}
