import 'package:dartz/dartz.dart';
import 'package:depifinalproject/core/errors/servier_failure.dart';
import 'package:depifinalproject/feature/auth/domain/entity/user_entity.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserEntity>> signUpWithEmailAndPassword({
    required String email,
    required String password,
    required String phoneNumber,
    required String userType,
    required String userCity,
    required String name,
  });
  Future<Either<Failure, UserEntity>> signinWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<Either<Failure, UserEntity>> signinWithGoogle();
  // Future<Either<Failure, UserEntity>> signInWithFacebook();

  Future addUserDataToDataBase({required UserEntity user});
  Future saveUserDataInlocalStorage({required UserEntity user});
  Future<UserEntity> readUserDataFromDataBase({required String userID});
  Future<bool> checkUserPhoneExits({required String phone});
}
