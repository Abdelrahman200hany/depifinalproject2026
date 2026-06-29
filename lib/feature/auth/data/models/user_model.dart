import 'package:depifinalproject/feature/auth/domain/entity/user_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  final String name, email, userID, phoneNumber, userCity, userType;

  final String imageUrl;
  final bool isValided;

  UserModel({
     required this.isValided,
    required this.imageUrl,
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
      isValided:false,
      imageUrl: '',
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
      isValided: isValided,
      imageUrl: imageUrl,
      name: name,
      email: email,
      userID: userID,
      phoneNumber: phoneNumber,
      userType: userType,
      userCity: userCity,
    );
  }

  // covert the map from database to user model
  factory UserModel.fromjson(json) {
    return UserModel(
      isValided: json['isValided'],
      imageUrl: json['imageUrl'],
      phoneNumber: json['phoneNumber'],
      userCity: json['userCity'],
      userType: json['userType'],
      name: json['name'],
      userID: json['id'],
      email: json['email'],
    );
  }

  factory UserModel.fromUserEntity(UserEntity userEntity) {
    return UserModel(
      isValided: userEntity.isValided,
      imageUrl: userEntity.imageUrl,
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
      'isValided':isValided,
      'imageUrl':imageUrl,
      'phoneNumber': phoneNumber,
      'userType': userType,
      'userCity': userCity,
      'name': name,
      'id': userID,
      'email': email,
    };
  }
}
