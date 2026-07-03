import 'package:dartz/dartz.dart';
import 'package:depifinalproject/core/errors/servier_failure.dart';
import 'package:depifinalproject/feature/auth/domain/entity/user_entity.dart';
import 'package:depifinalproject/feature/auth/domain/repo/auth_repo.dart';

class UpdateUserDataUseCase {
  final AuthRepo authRepo;

  UpdateUserDataUseCase(this.authRepo);

  Future<Either<Failure, void>> call({required UserEntity user}) async {
    return await authRepo.updateUserData(user: user);
  }
}
