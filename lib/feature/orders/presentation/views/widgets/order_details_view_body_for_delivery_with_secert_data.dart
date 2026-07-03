import 'package:depifinalproject/core/consts/consts.dart';
import 'package:depifinalproject/core/widgets/custom_app_bar.dart';
import 'package:depifinalproject/feature/home/domin/entity/order_entity.dart';
import 'package:depifinalproject/feature/orders/presentation/views/widgets/add_offer_to_order_buttom.dart';
import 'package:depifinalproject/feature/orders/presentation/views/widgets/custom_order_over_all_data_details.dart';
import 'package:depifinalproject/feature/orders/presentation/views/widgets/custom_order_data_payment_deatial.dart';
import 'package:depifinalproject/feature/orders/presentation/views/widgets/custom_order_header_data_details.dart';
import 'package:depifinalproject/feature/orders/presentation/views/widgets/custom_order_recevier_data_details.dart';
import 'package:depifinalproject/feature/orders/presentation/views/widgets/custom_order_sender_data_details.dart';
import 'package:flutter/material.dart';

class OrderDetailsViewBodyForDeliverywithSecretData extends StatelessWidget {
  const OrderDetailsViewBodyForDeliverywithSecretData({
    super.key,
    required this.item,
  });
  final OrderEntity item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'تفاصيل الطلب', wantedIconBack: true),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHoriztailPadding),
        child: ListView(
          children: [
            const SizedBox(height: 20),

            /// Header Details
            CustomOrderHeaderDataDetails(
              data: item.pickupDate,
              from: item.pickupGovernorate,
              to: item.recipientGovernorate,
              orderId: item.uIdOrder,
              status: item.orderStatus,
            ),

            const SizedBox(height: 8),

            /// Overall Order Details
            CustomOrderOverAllDataDetails(
              imageVesrion: item.imageVersion,
              description: item.parcelDescription,
              image: item.parcelImage!,
              name: item.parcelName,
              note: item.additionalNotes,
              type: item.parcelType,
            ),

            const SizedBox(height: 16),

            /// Sender Details
            CustomOrderSenderDataDetails(
              name: item.senderName,
              goverment: item.pickupGovernorate,
              phone: item.senderPhone,
              address: item.pickupAddress,
              addressMark: item.pickupMark,
              pickUpData: item.pickupDate,
              pickupTime: item.pickupTime,
              locationLinkFrom: item.locationlinkFrom,
            ),

            const SizedBox(height: 16),

            /// Receiver Details
            CustomOrderReceiverDataDetails(
              name: 'ك*********',
              goverment: item.recipientGovernorate,
              phone: '012********',
              address: item.recipientAddress,
              addressMark: item.recipientMark,
              deliveryData: item.deliveryDate,
              deliveryTime: item.deliveryTime,
              locationUrlTo: item.locationlinkTo,
            ),

            const SizedBox(height: 16),

            /// Payment Details
            CustomOrderDataPaymentDetails(
              orderPrice: item.parcelPrice,
              deliveryPrice: item.deliveryPrice,
            ),

            const SizedBox(height: 16),

            /// Delivery Offer Button
            AddOfferToOrderButtom(item: item),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
