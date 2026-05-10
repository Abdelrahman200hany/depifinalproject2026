import 'dart:io';

class OrderEntity {
  final int imageVersion;
  // الأساسي
  final String uIdOrder;
  final String createdBy;
  final String orderStatus;

  // بيانات المرسل
  final String senderName;
  final String senderPhone;

  // بيانات الاستلام
  final String pickupGovernorate;
  final String pickupAddress;
  final String pickupMark;
  final String pickupDate;
  final String pickupTime;

  // تفاصيل الطرد
  final String parcelName;
  final String parcelType;
  final String parcelDescription;
  final String additionalNotes;
  String? parcelImage;

  // الأسعار
  final double parcelPrice;
  final double deliveryPrice;

  // بيانات التسليم
  final String recipientGovernorate;
  final String recipientName;
  final String recipientAddress;
  final String recipientMark;
  final String recipientPhone;

  // وقت التسليم
  final String deliveryDate;
  final String deliveryTime;

  File? imageFile;

  OrderEntity({
    this.imageVersion = 1,
    this.orderStatus = 'في الانتظار',
    this.imageFile,
    required this.uIdOrder,
    required this.createdBy,
    required this.senderName,
    required this.senderPhone,
    required this.pickupGovernorate,
    required this.pickupAddress,
    required this.pickupMark,
    required this.pickupDate,
    required this.pickupTime,
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
    required this.deliveryDate,
    required this.deliveryTime,
  });
  OrderEntity copyWith({
    int? imageVersion,
    String? uIdOrder,
    String? createdBy,
    String? orderStatus,
    String? senderName,
    String? senderPhone,
    String? pickupGovernorate,
    String? pickupAddress,
    String? pickupMark,
    String? pickupDate,
    String? pickupTime,
    String? parcelName,
    String? parcelType,
    String? parcelDescription,
    String? additionalNotes,
    String? parcelImage,
    double? parcelPrice,
    double? deliveryPrice,
    String? recipientGovernorate,
    String? recipientName,
    String? recipientAddress,
    String? recipientMark,
    String? recipientPhone,
    String? deliveryDate,
    String? deliveryTime,
    File? imageFile,
  }) {
    return OrderEntity(
      imageVersion: imageVersion ?? this.imageVersion,
      uIdOrder: uIdOrder ?? this.uIdOrder,
      createdBy: createdBy ?? this.createdBy,
      orderStatus: orderStatus ?? this.orderStatus,
      senderName: senderName ?? this.senderName,
      senderPhone: senderPhone ?? this.senderPhone,
      pickupGovernorate: pickupGovernorate ?? this.pickupGovernorate,
      pickupAddress: pickupAddress ?? this.pickupAddress,
      pickupMark: pickupMark ?? this.pickupMark,
      pickupDate: pickupDate ?? this.pickupDate,
      pickupTime: pickupTime ?? this.pickupTime,
      parcelName: parcelName ?? this.parcelName,
      parcelType: parcelType ?? this.parcelType,
      parcelDescription: parcelDescription ?? this.parcelDescription,
      additionalNotes: additionalNotes ?? this.additionalNotes,
      parcelImage: parcelImage ?? this.parcelImage,
      parcelPrice: parcelPrice ?? this.parcelPrice,
      deliveryPrice: deliveryPrice ?? this.deliveryPrice,
      recipientGovernorate: recipientGovernorate ?? this.recipientGovernorate,
      recipientName: recipientName ?? this.recipientName,
      recipientAddress: recipientAddress ?? this.recipientAddress,
      recipientMark: recipientMark ?? this.recipientMark,
      recipientPhone: recipientPhone ?? this.recipientPhone,
      deliveryDate: deliveryDate ?? this.deliveryDate,
      deliveryTime: deliveryTime ?? this.deliveryTime,
      imageFile: imageFile ?? this.imageFile,
    );
  }
}
