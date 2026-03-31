import 'package:depifinalproject/feature/orders/presentation/views/widgets/order_item_details_data.dart';
import 'package:depifinalproject/feature/orders/presentation/views/widgets/product_details_sec_data.dart';
import 'package:flutter/material.dart';

class CustomOrderDataPaymentDetails extends StatelessWidget {
  const CustomOrderDataPaymentDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return const OrderItemDetailsSecData(
      title: 'البيانات المالية',
      icon: 'asstes/images/dollar_icon.png',
      children: [
        OrderItemDeatilsData(title: 'مبلغ التحصيل', dataDetails: '250 ر.س'),
        OrderItemDeatilsData(title: 'عربون', dataDetails: '50 ر.س'),
        OrderItemDeatilsData(title: 'السعر المقترح', dataDetails: '45 ر.س'),
      ],
    );
  }
}