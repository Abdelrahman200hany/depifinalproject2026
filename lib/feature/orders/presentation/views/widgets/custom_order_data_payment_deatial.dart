import 'package:depifinalproject/feature/orders/presentation/views/widgets/order_item_details_data.dart';
import 'package:depifinalproject/feature/orders/presentation/views/widgets/product_details_sec_data.dart';
import 'package:flutter/material.dart';

class CustomOrderDataPaymentDetails extends StatelessWidget {
  const CustomOrderDataPaymentDetails({
    super.key,
    required this.orderPrice,
    required this.deliveryPrice,
  });
  final double orderPrice, deliveryPrice;
  @override
  Widget build(BuildContext context) {
    return OrderItemDetailsSecData(
      title: 'البيانات المالية',
      icon: 'asstes/images/dollar_icon.png',
      children: [
        OrderItemDeatilsData(title: 'نوع التحصيل', dataDetails: 'دفع مقدم'),
        OrderItemDeatilsData(
          title: 'سعر الطرد',
          dataDetails: '$orderPrice جنية',
        ),
        OrderItemDeatilsData(
          title: 'سعر التوصيل',
          dataDetails: '$deliveryPrice جنية',
        ),
      ],
    );
  }
}
