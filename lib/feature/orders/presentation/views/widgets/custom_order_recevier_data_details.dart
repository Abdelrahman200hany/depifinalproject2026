
import 'package:depifinalproject/feature/orders/presentation/views/widgets/order_item_details_data.dart';
import 'package:depifinalproject/feature/orders/presentation/views/widgets/product_details_sec_data.dart';
import 'package:flutter/material.dart';

class CustomOrderReceiverDataDetails extends StatelessWidget {
  const CustomOrderReceiverDataDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return OrderItemDetailsSecData(
      title: 'بيانات التسليم',
      icon: 'asstes/images/true_icon.png',
      children: [
        const OrderItemDeatilsData(
          title: 'المستلم',
          dataDetails: 'سارة العتيبي',
        ),
        const OrderItemDeatilsData(
          title: 'رقم الجوال',
          dataDetails: '055XXXXX89',
        ),
        const OrderItemDeatilsData(
          title: 'العنوان',
          dataDetails: 'جدة, حي الشاطئ, طريق الكورنيش',
        ),
        const OrderItemDeatilsData(
          title: 'تاريخ التوصيل المتوقع',
          dataDetails: '16 أكتوبر 2025',
        ),
        const SizedBox(height: 10),
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            'asstes/images/map_2.png',
            height: 120,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
