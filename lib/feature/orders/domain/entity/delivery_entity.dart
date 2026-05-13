import 'package:depifinalproject/feature/auth/domain/entity/user_entity.dart';

class DeliveryEntity {
  final UserEntity driver;
  final double proposedPrice;
  final String status;
  final DateTime createdAt;

  DeliveryEntity({
    required this.driver,
    required this.proposedPrice,
    this.status = 'pending',
    required this.createdAt,
  });

  DeliveryEntity copyWith({
    UserEntity? driver,
    double? proposedPrice,
    String? status,
    DateTime? createdAt,
  }) {
    return DeliveryEntity(
      driver: driver ?? this.driver,
      proposedPrice: proposedPrice ?? this.proposedPrice,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}