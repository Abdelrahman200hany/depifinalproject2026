import 'package:bloc/bloc.dart';
import 'package:depifinalproject/feature/auth/domain/entity/user_entity.dart';
import 'package:depifinalproject/feature/auth/domain/repo/auth_repo.dart';
import 'package:meta/meta.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit(this.authRepo) : super(SignInInitial());
  final AuthRepo authRepo;
  Future<void> signInWithEmailAndPassword({
    required String passord,
    required String email,
  }) async {
    emit(SignInloading());

    var result = await authRepo.signinWithEmailAndPassword(
      email: email,
      password: passord,
    );

    result.fold(
      (faulire) {
        emit(SignInfaulire(errorMessage: faulire.message));
      },
      (user) {
        emit(SignInSuccess(user: user));
      },
    );
  }
}
