import 'package:depifinalproject/feature/orders/presentation/views/widgets/order_item_details_data.dart';
import 'package:depifinalproject/feature/orders/presentation/views/widgets/product_details_sec_data.dart';
import 'package:flutter/material.dart';

class CustomOrderReceiverDataDetails extends StatelessWidget {
  const CustomOrderReceiverDataDetails({
    super.key,
    required this.name,
    required this.phone,
    required this.goverment,
    required this.address,
    required this.addressMark,
    required this.deliveryData,
    required this.deliveryTime,
  });

  final String name,
      phone,
      goverment,
      address,
      addressMark,
      deliveryData,
      deliveryTime;

  @override
  Widget build(BuildContext context) {
    return OrderItemDetailsSecData(
      title: 'بيانات التسليم',
      icon: 'asstes/images/true_icon.png',
      children: [
        OrderItemDeatilsData(title: 'المستلم', dataDetails: name),
        OrderItemDeatilsData(title: 'رقم الجوال', dataDetails: phone),
        OrderItemDeatilsData(
          title: 'العنوان',
          dataDetails: '$goverment _ $address',
        ),
        OrderItemDeatilsData(title: 'علامة مميزة', dataDetails: addressMark),
        OrderItemDeatilsData(
          title: 'تاريخ التوصيل ',
          dataDetails: deliveryData,
        ),
        OrderItemDeatilsData(
          title: 'وقت التوصيل المتوقع',
          dataDetails: deliveryTime,
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
