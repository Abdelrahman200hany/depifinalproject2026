class UserEntity {
  final String email, name, phoneNumber, userType, userCity;
  final String? password, userID;

  UserEntity({
     this.password,
    this.userID,
    required this.email,
    required this.name,
    required this.phoneNumber,

    required this.userType,
    required this.userCity,
  });
}
