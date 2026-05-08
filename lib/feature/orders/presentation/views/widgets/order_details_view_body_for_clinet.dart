import 'package:depifinalproject/core/consts/consts.dart';
import 'package:depifinalproject/core/widgets/custom_app_bar.dart';
import 'package:depifinalproject/core/widgets/custom_text_bottom_with_background.dart';
import 'package:depifinalproject/feature/home/domin/entity/order_entity.dart';
import 'package:depifinalproject/feature/orders/presentation/views/widgets/custom_order_data_details.dart';
import 'package:depifinalproject/feature/orders/presentation/views/widgets/custom_order_data_payment_deatial.dart';
import 'package:depifinalproject/feature/orders/presentation/views/widgets/custom_order_header_data_details.dart';
import 'package:depifinalproject/feature/orders/presentation/views/widgets/custom_order_recevier_data_details.dart';
import 'package:depifinalproject/feature/orders/presentation/views/widgets/custom_order_sender_data_details.dart';
import 'package:flutter/material.dart';

class OrderDetailsViewBodyforClinet extends StatelessWidget {
  const OrderDetailsViewBodyforClinet({super.key, required this.orderItem});

  final OrderEntity orderItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'تفاصيل الطلب', wantedIconBack: true),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHoriztailPadding),
        child: ListView(
          children: [
            const SizedBox(height: 20),
            CustomOrderHeaderDataDetails(
              data: orderItem.pickupDate,
              from: orderItem.pickupGovernorate,
              to: orderItem.recipientGovernorate,
              orderId: orderItem.uIdOrder,
              status: orderItem.orderStatus,
            ),
            const SizedBox(height: 8),
            CustomOrderOverAllDataDetails(
              description: orderItem.parcelDescription,
              image: orderItem.parcelImage!,
              name: orderItem.parcelName,
              note: orderItem.additionalNotes,
              type: orderItem.parcelType,
            ),
            const SizedBox(height: 16),
            CustomOrderSenderDataDetails(
              name: orderItem.senderName,
              goverment: orderItem.pickupGovernorate,
              phone: orderItem.senderPhone,
              address: orderItem.pickupAddress,
              addressMark: orderItem.pickupMark,
              pickUpData: orderItem.pickupDate,
              pickupTime: orderItem.pickupTime,
            ),
            const SizedBox(height: 16),

            CustomOrderReceiverDataDetails(
              name: orderItem.recipientName,
              goverment: orderItem.recipientGovernorate,
              phone: orderItem.recipientPhone,
              address: orderItem.recipientAddress,
              addressMark: orderItem.recipientMark,
              deliveryData: orderItem.deliveryDate,
              deliveryTime: orderItem.deliveryTime,
            ),
            const SizedBox(height: 16),

            CustomOrderDataPaymentDetails(
              orderPrice: orderItem.parcelPrice,
              deliveryPrice: orderItem.deliveryPrice,
            ),
            const SizedBox(height: 16),
            CustomTextBottomWithBackground(text: 'تعديل الطلب', ontap: () {}),
            const SizedBox(height: 16),
            CustomTextBottomWithBackground(
              text: 'الغاء الطلب',
              ontap: () {},
              backgroundColor: Colors.redAccent,
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
