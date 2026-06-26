import 'package:depifinalproject/core/utils/assets.dart';
import 'package:depifinalproject/feature/orders/presentation/views/widgets/order_item_details_data.dart';
import 'package:depifinalproject/feature/orders/presentation/views/widgets/product_details_sec_data.dart';
import 'package:flutter/material.dart';

class CustomDeliveryOverAllDataDetails extends StatelessWidget {
  const CustomDeliveryOverAllDataDetails({
    super.key,

    required this.name,

    required this.phone,

  });

  final String name;
  final String phone;

  @override
  Widget build(BuildContext context) {
    return OrderItemDetailsSecData(
      title: 'بيانات المندوب',

      icon: Assets.imagesZewaidiIcon,

      children: [
        OrderItemDeatilsData(title: 'اسم المندوب', dataDetails: name),

        OrderItemDeatilsData(title: 'رقم الهاتف', dataDetails: phone),

        // OrderItemDeatilsData(title: 'سعر التوصيل', dataDetails: deliveryPrice),
      ],
    );
  }
}
