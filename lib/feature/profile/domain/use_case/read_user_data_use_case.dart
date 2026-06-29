import 'package:dartz/dartz.dart';
import 'package:depifinalproject/core/errors/servier_failure.dart';
import 'package:depifinalproject/feature/auth/domain/entity/user_entity.dart';
import 'package:depifinalproject/feature/auth/domain/repo/auth_repo.dart';

class ReadUserDataUseCase {
  final AuthRepo authRepo;

  ReadUserDataUseCase(this.authRepo);

  Future<Either<Failure, UserEntity>> call({required String userID}) async {
    try {
      final user = await authRepo.readUserDataFromDataBase(userID: userID);

      return right(user);
    } catch (e) {
      return left(ServerFailure(message: "حدث خطأ أثناء جلب بيانات المستخدم"));
    }
  }
}
