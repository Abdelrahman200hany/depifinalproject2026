import 'package:depifinalproject/core/consts/consts.dart';

class UserEntity {
  final String email, name, phoneNumber, userType, userCity;
  final String? password, userID;
  final String imageUrl;
  final bool isValided;

  UserEntity({
    this.isValided = false,
    this.imageUrl = kFaceImageUrl,
    this.password,
    this.userID,
    required this.email,
    required this.name,
    required this.phoneNumber,

    required this.userType,
    required this.userCity,
  });

  UserEntity copyWith({
    String? email,
    String? name,
    String? phoneNumber,
    String? userType,
    String? userCity,
    String? password,
    String? userID,
    String? imageUrl,
    bool? isValided,
  }) {
    return UserEntity(
      email: email ?? this.email,
      name: name ?? this.name,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      userType: userType ?? this.userType,
      userCity: userCity ?? this.userCity,
      password: password ?? this.password,
      userID: userID ?? this.userID,
      imageUrl: imageUrl ?? this.imageUrl,
      isValided: isValided ?? this.isValided,
    );
  }
}
