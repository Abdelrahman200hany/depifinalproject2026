import 'package:depifinalproject/core/consts/consts.dart';
import 'package:depifinalproject/feature/auth/domain/entity/user_entity.dart';

class DeliveryEntity {
  final UserEntity driver;
  final double proposedPrice;
  final String offerStatus;
  final DateTime createdAt;

  DeliveryEntity({
    required this.driver,
    required this.proposedPrice,
    this.offerStatus = kstatusofferpending,
    required this.createdAt,
  });

  DeliveryEntity copyWith({
    UserEntity? driver,
    double? proposedPrice,
    String? offerStatus,
    DateTime? createdAt,
  }) {
    return DeliveryEntity(
      driver: driver ?? this.driver,
      proposedPrice: proposedPrice ?? this.proposedPrice,
      offerStatus: offerStatus ?? this.offerStatus,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
