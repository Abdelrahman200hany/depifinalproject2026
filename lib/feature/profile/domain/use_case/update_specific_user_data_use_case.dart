import 'package:dartz/dartz.dart';
import 'package:depifinalproject/core/errors/servier_failure.dart';
import 'package:depifinalproject/feature/auth/domain/repo/auth_repo.dart';

class UpdateSpecificUserDataUseCase {
  final AuthRepo repo;

  UpdateSpecificUserDataUseCase(this.repo);

  Future<Either<Failure, void>> call({
    required String userId,

    required Map<String, dynamic> data,
  }) {
    return repo.updateSpecificUserData(userId: userId, data: data);
  }
}
