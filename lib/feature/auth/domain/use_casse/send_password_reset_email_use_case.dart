import 'package:dartz/dartz.dart';
import 'package:depifinalproject/core/errors/servier_failure.dart';
import 'package:depifinalproject/feature/auth/domain/repo/auth_repo.dart';

class SendPasswordResetEmailUseCase {
  final AuthRepo authRepo;

  SendPasswordResetEmailUseCase(this.authRepo);

  Future<Either<Failure, void>> call({required String email}) {
    return authRepo.sendPasswordResetEmail(email: email);
  }
}
