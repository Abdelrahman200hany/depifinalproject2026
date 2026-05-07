import 'package:depifinalproject/feature/home/domin/entity/order_entity.dart';

class GetDummyOrders {
  /// 🔹 Order واحد
  static OrderEntity get singleOrder => OrderEntity(
    uIdOrder: 'order_1',
    createdBy: 'user_123',
    senderName: 'Ahmed Ali',
    senderPhone: '01000000000',
    pickupGovernorate: 'Cairo',
    pickupAddress: 'Nasr City',
    pickupMark: 'Near Mall',
    pickupDate: '2026-05-07',
    pickupTime: '10:00 AM',
    parcelName: 'Laptop',
    parcelType: 'Electronics',
    parcelDescription: 'Dell Laptop',
    additionalNotes: 'Handle with care',
    parcelPrice: 15000,
    deliveryPrice: 50,
    recipientGovernorate: 'Giza',
    recipientName: 'Mohamed Hassan',
    recipientAddress: 'Dokki',
    recipientMark: 'Next to Metro',
    recipientPhone: '01111111111',
    deliveryDate: '2026-05-08',
    deliveryTime: '02:00 PM',
  );

  /// 🔹 List Orders
  static List<OrderEntity> get ordersList => List.generate(
    3,
    (index) => singleOrder);
    
    
    
 
}
