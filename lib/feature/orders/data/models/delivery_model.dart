import 'package:depifinalproject/feature/auth/data/models/user_model.dart';
import 'package:depifinalproject/feature/orders/domain/entity/delivery_entity.dart';

class DeliveryModel {
  final UserModel driver;
  final double proposedPrice;
  final String offerStatus;
  final DateTime createdAt;

  DeliveryModel({
    required this.driver,
    required this.proposedPrice,
    required this.offerStatus,
    required this.createdAt,
  });

  /// FROM JSON
  factory DeliveryModel.fromJson(Map<String, dynamic> json) {
    return DeliveryModel(
      driver: UserModel.fromjeson(json['driver']),
      proposedPrice: (json['proposedPrice'] as num).toDouble(),
      offerStatus: json['offerStatus'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }

  /// TO MAP
  Map<String, dynamic> toMap() {
    return {
      'driver': driver.toMap(),
      'proposedPrice': proposedPrice,
      'offerStatus': offerStatus,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  /// FROM ENTITY
  factory DeliveryModel.fromEntity(DeliveryEntity entity) {
    return DeliveryModel(
      driver: UserModel.fromUserEntity(entity.driver),
      proposedPrice: entity.proposedPrice,
      offerStatus: entity.status,
      createdAt: entity.createdAt,
    );
  }

  /// TO ENTITY
  DeliveryEntity toEntity() {
    return DeliveryEntity(
      driver: driver.toEntity(),
      proposedPrice: proposedPrice,
      status: offerStatus,
      createdAt: createdAt,
    );
  }
}
