import 'package:depifinalproject/feature/orders/presentation/views/widgets/order_item_details_data.dart';
import 'package:depifinalproject/feature/orders/presentation/views/widgets/product_details_sec_data.dart';
import 'package:flutter/material.dart';

class CustomOrderSenderDataDetails extends StatelessWidget {
  const CustomOrderSenderDataDetails({
    super.key,
    required this.name,
    required this.phone,
    required this.goverment,
    required this.address,
    required this.addressMark,
    required this.pickUpData,
    required this.pickupTime,
  });
  final String name,
      phone,
      goverment,
      address,
      addressMark,
      pickUpData,
      pickupTime;

  @override
  Widget build(BuildContext context) {
    return OrderItemDetailsSecData(
      title: 'بيانات الاستلام',
      icon: 'asstes/images/location_icon.png',
      children: [
        OrderItemDeatilsData(title: 'الاسم', dataDetails: name),
        OrderItemDeatilsData(title: 'رقم الجوال', dataDetails: phone),
        OrderItemDeatilsData(
          title: 'العنوان',
          dataDetails: '$goverment _ $address',
        ),
        OrderItemDeatilsData(title: 'علامه مميزة', dataDetails: addressMark),
        OrderItemDeatilsData(title: 'تاريخ الاستلام', dataDetails: pickUpData),
        OrderItemDeatilsData(
          title: 'وقت الاستلام المتوقع',
          dataDetails: pickupTime,
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
