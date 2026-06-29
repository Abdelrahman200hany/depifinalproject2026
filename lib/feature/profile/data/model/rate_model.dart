import 'package:depifinalproject/feature/auth/data/models/user_model.dart';
import 'package:depifinalproject/feature/profile/domain/entity/rate_entity.dart';

class RateModel {
  final UserModel user;

  final int rate;

  final String rateString;

  RateModel({required this.user, required this.rate, required this.rateString});

  // json -> model

  factory RateModel.fromJson(Map<String, dynamic> json) {
    return RateModel(
      user: UserModel.fromjson(json['user']),

      rate: json['rate'],

      rateString: json['rateString'],
    );
  }

  // model -> json

  Map<String, dynamic> toJson() {
    return {'user': user.toMap(), 'rate': rate, 'rateString': rateString};
  }

  // model -> entity

  RateEntity toEntity() {
    return RateEntity(
      user: user.toEntity(),

      rate: rate,

      rateString: rateString,
    );
  }

  // entity -> model

  factory RateModel.fromEntity(RateEntity entity) {
    return RateModel(
      user: UserModel.fromUserEntity(entity.user),

      rate: entity.rate,

      rateString: entity.rateString,
    );
  }
}
