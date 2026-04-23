import 'package:depifinalproject/core/consts/consts.dart';
import 'package:depifinalproject/core/methods/show_model_buttom_sheet.dart';
import 'package:depifinalproject/core/widgets/custom_app_bar.dart';
import 'package:depifinalproject/core/widgets/custom_text_bottom_with_background.dart';
import 'package:depifinalproject/feature/orders/presentation/views/widgets/custom_order_data_details.dart';
import 'package:depifinalproject/feature/orders/presentation/views/widgets/custom_order_data_payment_deatial.dart';
import 'package:depifinalproject/feature/orders/presentation/views/widgets/custom_order_header_data_details.dart';
import 'package:depifinalproject/feature/orders/presentation/views/widgets/custom_order_recevier_data_details.dart';
import 'package:depifinalproject/feature/orders/presentation/views/widgets/custom_order_sender_data_details.dart';
import 'package:depifinalproject/feature/orders/presentation/views/widgets/show_model_buttom_sheet_delivery_offer.dart';
import 'package:flutter/material.dart';

class OrderDetailsViewBodyForDelivery extends StatelessWidget {
  const OrderDetailsViewBodyForDelivery({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'تفاصيل الطلب', wantedIconBack: true),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHoriztailPadding),
        child: ListView(
          children: [
            const SizedBox(height: 20),
            const CustomOrderHeaderDataDetails(),
            const SizedBox(height: 8),
            const CustomOrderOverAllDataDetails(),
            const SizedBox(height: 16),
            const CustomOrderSenderDataDetails(),
            const SizedBox(height: 16),

            const CustomOrderReceiverDataDetails(),
            const SizedBox(height: 16),

            const CustomOrderDataPaymentDetails(),
            const SizedBox(height: 16),

            CustomTextBottomWithBackground(
              text: 'تقديم عرض',
              ontap: () {
                showCustomModelButtomSheet(
                  context,
                  child: ShowModelButtomSheetDelvieryOffer(),
                );
              },
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
