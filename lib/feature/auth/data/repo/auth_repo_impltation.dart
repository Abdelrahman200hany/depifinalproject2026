import 'dart:convert';
import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:depifinalproject/core/consts/consts.dart';
import 'package:depifinalproject/core/errors/custom_expetion.dart';
import 'package:depifinalproject/core/errors/servier_failure.dart';
import 'package:depifinalproject/core/serviecs/auth_services/fire_base_auth_services.dart';
import 'package:depifinalproject/core/serviecs/data_base_services/data_base_services.dart';
import 'package:depifinalproject/core/serviecs/shared_prefs_services/shared_prefs.dart';
import 'package:depifinalproject/core/utils/app_backend_endpoints.dart';
import 'package:depifinalproject/feature/auth/data/models/user_model.dart';
import 'package:depifinalproject/feature/auth/domain/entity/user_entity.dart';
import 'package:depifinalproject/feature/auth/domain/repo/auth_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepoImpl implements AuthRepo {
  final FirebaseAuthServiecs firebaseAuthServies;
  final DataBaseServies dataBaseServies;

  AuthRepoImpl(this.firebaseAuthServies, this.dataBaseServies);
  @override
  Future<Either<Failure, UserEntity>> signUpWithEmailAndPassword({
    required String email,
    required String password,
    required String phoneNumber,
    required String userType,
    required String userCity,

    required String name,
  }) async {
    User? user;

    try {
      bool phoneUsed = await checkUserPhoneExits(phone: phoneNumber);
      if (phoneUsed) {
        return left(ServerFailure(message: 'هذا الرقم مسجل بالفعل'));
      }
      user = await firebaseAuthServies.signUpWithEmailAndPassword(
        email: email,
        password: password,
      );
      var userEntity = UserEntity(
        password: password,
        phoneNumber: phoneNumber,
        userCity: userCity,
        userType: userType,
        name: name,
        userID: user.uid,
        email: email,
      );
       firebaseAuthServies.sendEmailVerification(user);

      await addUserDataToDataBase(user: userEntity);
      return right(userEntity);
    } on CustomExpetion catch (e) {
      await deleteUser(user);

      return left(ServerFailure(message: e.message));
    } catch (e) {
      await deleteUser(user);

      log('the error in AuthRepoImpl.createUserWithEmailAndPassword is $e');
      return left(ServerFailure(message: 'حدث خطأ ما حاول مره اخري'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signinWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      var user = await firebaseAuthServies.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      bool verified = await firebaseAuthServies.checkEmailVerified();

      if (!verified) {
         firebaseAuthServies.sendEmailVerification(user);

        return left(
          ServerFailure(
            message: 'الرجاء الذهاب الي البريد و تاكيد تفعيل الحساب',
          ),
        );
      }
      var userEntity = await readUserDataFromDataBase(userID: user.uid);
      await saveUserDataInlocalStorage(user: userEntity);
      return right(userEntity);
    } on CustomExpetion catch (e) {
      return left(ServerFailure(message: e.message));
    } catch (e) {
      log('the error in AuthRepoImpl.signinWithEmailAndPasswordis $e');

      return left(ServerFailure(message: 'حدث خطأ ما حاول مره اخري'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signinWithGoogle() async {
    User? user;
    try {
      user = await firebaseAuthServies.signInWithGoogle();

      var userEntity = UserModel.fromFirebaseUser(user);
      bool userDataExits = await dataBaseServies.chekedDataIfExitsinDatabase(
        deumentID: userEntity.userID!,
        path: AppBackendEndpoints.checkIfUserIsExits,
      );

      if (userDataExits) {
        await readUserDataFromDataBase(userID: userEntity.userID!);
        await saveUserDataInlocalStorage(user: userEntity);
      } else {
        await addUserDataToDataBase(user: userEntity);
      }

      return right(userEntity);
    } catch (e) {
      await deleteUser(user);

      log('the error in AuthRepoImpl.signinWithGoogle is $e');

      return left(ServerFailure(message: 'حدث خطأ ما حاول مره اخري'));
    }
  }

  @override
  Future addUserDataToDataBase({required UserEntity user}) async {
    await dataBaseServies.addData(
      documentID: user.userID,
      path: AppBackendEndpoints.addUserCollention,
      data: UserModel.fromUserEntity(user).toMap(),
    );
  }

  @override
  Future<UserEntity> readUserDataFromDataBase({required String userID}) async {
    var userdata = await dataBaseServies.readData(
      documentID: userID,
      path: AppBackendEndpoints.readUserCollention,
    );
    //  to convert the map in dataBase to UserModel
    return UserModel.fromjeson(userdata);
  }

  @override
  Future saveUserDataInlocalStorage({required UserEntity user}) async {
    var userData = jsonEncode(UserModel.fromUserEntity(user).toMap());
    await Prefs.setString(kUserDataSave, userData);
  }

  Future<void> deleteUser(User? user) async {
    if (user != null) {
      await firebaseAuthServies.deletedUser();
    }
  }

  @override
  Future<bool> checkUserPhoneExits({required String phone}) async {
    var result = await dataBaseServies.readWhereData(
      path: AppBackendEndpoints.filterUserData,
      field: "phoneNumber",
      value: phone,
    );

    return result.isNotEmpty;
  }
}
