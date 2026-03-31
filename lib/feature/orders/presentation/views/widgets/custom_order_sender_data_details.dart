
import 'package:depifinalproject/feature/orders/presentation/views/widgets/order_item_details_data.dart';
import 'package:depifinalproject/feature/orders/presentation/views/widgets/product_details_sec_data.dart';
import 'package:flutter/material.dart';

class CustomOrderSenderDataDetails extends StatelessWidget {
  const CustomOrderSenderDataDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return OrderItemDetailsSecData(
      title: 'بيانات الاستلام',
      icon: 'asstes/images/location_icon.png',
      children: [
        const OrderItemDeatilsData(title: 'الاسم', dataDetails: 'أحمد محمود'),
        const OrderItemDeatilsData(
          title: 'رقم الجوال',
          dataDetails: '050XXXXX12',
        ),
        const OrderItemDeatilsData(
          title: 'العنوان',
          dataDetails: 'الرياض, حي الملقا, شارع الأمير محمد بن سعد',
        ),
        const OrderItemDeatilsData(
          title: 'التاريخ والوقت',
          dataDetails: '14 أكتوبر, 10:00 صباحاً',
        ),
        const SizedBox(height: 10),
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            'asstes/images/map_1.png',
            height: 120,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
