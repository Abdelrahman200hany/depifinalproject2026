import 'package:depifinalproject/feature/auth/domain/entity/user_entity.dart';

class RateEntity {
  final UserEntity user;

  final int rate;

  final String rateString;

  RateEntity({
    required this.user,

    required this.rate,

    required this.rateString,
  });
}
