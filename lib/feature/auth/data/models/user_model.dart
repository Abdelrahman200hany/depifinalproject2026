import 'package:depifinalproject/feature/auth/domain/entity/user_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  final String name, email, userID, phoneNumber, userCity, userType;

  UserModel({
    required this.name,

    required this.email,
    required this.userID,
    required this.phoneNumber,
    required this.userType,
    required this.userCity,
  });

  //convert the firebase user to Custom user model used in google and fackbook auht
  factory UserModel.fromFirebaseUser(User user) {
    return UserModel(
      userType: '',
      phoneNumber: '',
      userCity: '',
      name: user.displayName ?? '',
      userID: user.uid,
      email: user.email ?? '',
    );
  }

  // convert the model to entity
  UserEntity toEntity() {
    return UserEntity(
      name: name,
      email: email,
      userID: userID,
      phoneNumber: phoneNumber,
      userType: userType,
      userCity: userCity,
    );
  }

  // covert the map from database to user model
  factory UserModel.fromjeson(jeson) {
    return UserModel(
      phoneNumber: jeson['phoneNumber'],
      userCity: jeson['userCity'],
      userType: jeson['userType'],
      name: jeson['name'],
      userID: jeson['id'],
      email: jeson['email'],
    );
  }

  factory UserModel.fromUserEntity(UserEntity userEntity) {
    return UserModel(
      phoneNumber: userEntity.phoneNumber,
      userCity: userEntity.userCity,
      userType: userEntity.userType,
      name: userEntity.name,
      userID: userEntity.userID!,
      email: userEntity.email,
    );
  }

  // convert the user model to map to save it in database

  toMap() {
    return {
      'phoneNumber': phoneNumber,
      'userType': userType,
      'userCity': userCity,
      'name': name,
      'id': userID,
      'email': email,
    };
  }
}
