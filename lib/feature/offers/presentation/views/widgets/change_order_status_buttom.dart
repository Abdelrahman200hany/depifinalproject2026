import 'package:depifinalproject/core/consts/consts.dart';
import 'package:depifinalproject/core/methods/show_model_buttom_sheet.dart';
import 'package:depifinalproject/core/widgets/custom_text_bottom_with_background.dart';
import 'package:depifinalproject/core/widgets/top_head_model_sheet_line.dart';
import 'package:depifinalproject/feature/home/domin/entity/order_entity.dart';
import 'package:depifinalproject/feature/offers/presentation/views/widgets/shipment_details_model_buttom_sheet.dart';
import 'package:flutter/material.dart';

class ChangeOrderStatusButtom extends StatelessWidget {
  const ChangeOrderStatusButtom({super.key, required this.order});
  final OrderEntity order;

  @override
  Widget build(BuildContext context) {
    return CustomTextBottomWithBackground(
      text: 'تغير حاله التوصيل ',

      ontap: () {
        showCustomModelButtomSheet(
          context,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kHoriztailPadding),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,

                children: [
                  TopHeadModelSheetLine(),
                  const SizedBox(height: 16),
                  ShipmentDetailsScreen(order: order),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
