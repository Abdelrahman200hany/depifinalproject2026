import 'package:depifinalproject/feature/home/domin/entity/order_entity.dart';

class OrderModel {
  final String uIdOrder;
  final String createdBy;

  final String senderName;
  final String senderPhone;

  final String pickupGovernorate;
  final String pickupAddress;
  final String pickupMark;

  final String parcelName;
  final String parcelType;
  final String parcelDescription;
  final String additionalNotes;
  final String? parcelImage;

  final double parcelPrice;
  final double deliveryPrice;

  final String recipientGovernorate;
  final String recipientName;
  final String recipientAddress;
  final String recipientMark;
  final String recipientPhone;

  // ✅ NEW: Pickup Date & Time
  final String pickupDate;
  final String pickupTime;

  // ✅ NEW: Delivery Date & Time
  final String deliveryDate;
  final String deliveryTime;

  OrderModel({
    required this.uIdOrder,
    required this.createdBy,
    required this.senderName,
    required this.senderPhone,
    required this.pickupGovernorate,
    required this.pickupAddress,
    required this.pickupMark,
    required this.parcelName,
    required this.parcelType,
    required this.parcelDescription,
    required this.additionalNotes,
    this.parcelImage,
    required this.parcelPrice,
    required this.deliveryPrice,
    required this.recipientGovernorate,
    required this.recipientName,
    required this.recipientAddress,
    required this.recipientMark,
    required this.recipientPhone,

    // pickup
    required this.pickupDate,
    required this.pickupTime,

    // delivery
    required this.deliveryDate,
    required this.deliveryTime,
  });

  /// FROM JSON
  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      uIdOrder: json['uIdOrder'],
      createdBy: json['createdBy'],
      senderName: json['senderName'],
      senderPhone: json['senderPhone'],
      pickupGovernorate: json['pickupGovernorate'],
      pickupAddress: json['pickupAddress'],
      pickupMark: json['pickupMark'],
      parcelName: json['parcelName'],
      parcelType: json['parcelType'],
      parcelDescription: json['parcelDescription'],
      additionalNotes: json['additionalNotes'],
      parcelImage: json['parcelImage'],
      parcelPrice: (json['parcelPrice'] as num).toDouble(),
      deliveryPrice: (json['deliveryPrice'] as num).toDouble(),
      recipientGovernorate: json['recipientGovernorate'],
      recipientName: json['recipientName'],
      recipientAddress: json['recipientAddress'],
      recipientMark: json['recipientMark'],
      recipientPhone: json['recipientPhone'],

      // pickup
      pickupDate: json['pickupDate'],
      pickupTime: json['pickupTime'],

      // delivery
      deliveryDate: json['deliveryDate'],
      deliveryTime: json['deliveryTime'],
    );
  }

  /// TO JSON
  Map<String, dynamic> toMap() {
    return {
      'uIdOrder': uIdOrder,
      'createdBy': createdBy,
      'senderName': senderName,
      'senderPhone': senderPhone,
      'pickupGovernorate': pickupGovernorate,
      'pickupAddress': pickupAddress,
      'pickupMark': pickupMark,
      'parcelName': parcelName,
      'parcelType': parcelType,
      'parcelDescription': parcelDescription,
      'additionalNotes': additionalNotes,
      'parcelImage': parcelImage,
      'parcelPrice': parcelPrice,
      'deliveryPrice': deliveryPrice,
      'recipientGovernorate': recipientGovernorate,
      'recipientName': recipientName,
      'recipientAddress': recipientAddress,
      'recipientMark': recipientMark,
      'recipientPhone': recipientPhone,

      // pickup
      'pickupDate': pickupDate,
      'pickupTime': pickupTime,

      // delivery
      'deliveryDate': deliveryDate,
      'deliveryTime': deliveryTime,
    };
  }

  /// FROM ENTITY
  factory OrderModel.fromEntity(OrderEntity entity) {
    return OrderModel(
      uIdOrder: entity.uIdOrder,
      createdBy: entity.createdBy,
      senderName: entity.senderName,
      senderPhone: entity.senderPhone,
      pickupGovernorate: entity.pickupGovernorate,
      pickupAddress: entity.pickupAddress,
      pickupMark: entity.pickupMark,
      parcelName: entity.parcelName,
      parcelType: entity.parcelType,
      parcelDescription: entity.parcelDescription,
      additionalNotes: entity.additionalNotes,
      parcelImage: entity.parcelImage,
      parcelPrice: entity.parcelPrice,
      deliveryPrice: entity.deliveryPrice,
      recipientGovernorate: entity.recipientGovernorate,
      recipientName: entity.recipientName,
      recipientAddress: entity.recipientAddress,
      recipientMark: entity.recipientMark,
      recipientPhone: entity.recipientPhone,

      // pickup
      pickupDate: entity.pickupDate,
      pickupTime: entity.pickupTime,

      // delivery
      deliveryDate: entity.deliveryDate,
      deliveryTime: entity.deliveryTime,
    );
  }

  /// TO ENTITY
  OrderEntity toEntity() {
    return OrderEntity(
      uIdOrder: uIdOrder,
      createdBy: createdBy,
      senderName: senderName,
      senderPhone: senderPhone,
      pickupGovernorate: pickupGovernorate,
      pickupAddress: pickupAddress,
      pickupMark: pickupMark,
      parcelName: parcelName,
      parcelType: parcelType,
      parcelDescription: parcelDescription,
      additionalNotes: additionalNotes,
      parcelImage: parcelImage,
      parcelPrice: parcelPrice,
      deliveryPrice: deliveryPrice,
      recipientGovernorate: recipientGovernorate,
      recipientName: recipientName,
      recipientAddress: recipientAddress,
      recipientMark: recipientMark,
      recipientPhone: recipientPhone,

      // pickup
      pickupDate: pickupDate,
      pickupTime: pickupTime,

      // delivery
      deliveryDate: deliveryDate,
      deliveryTime: deliveryTime,
    );
  }
}
