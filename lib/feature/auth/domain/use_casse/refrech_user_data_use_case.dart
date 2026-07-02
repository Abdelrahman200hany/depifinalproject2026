import 'package:dartz/dartz.dart';
import 'package:depifinalproject/core/errors/servier_failure.dart';
import 'package:depifinalproject/feature/auth/domain/entity/user_entity.dart';
import 'package:depifinalproject/feature/auth/domain/repo/auth_repo.dart';

class RefreshUserDataUseCase {
  final AuthRepo repo;

  RefreshUserDataUseCase(this.repo);

  Future<Either<Failure, UserEntity>> call({required String userId}) {
    return repo.refreshUserData(userId: userId);
  }
}
