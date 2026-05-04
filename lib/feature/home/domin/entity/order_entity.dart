class OrderEntity {
  // الأساسي
  final String uIdOrder;
  final String createdBy;

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
  final String? parcelImage;

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

  const OrderEntity({
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
}
