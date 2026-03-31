
import 'package:depifinalproject/core/utils/app_style.dart';
import 'package:flutter/material.dart';

class OrderItemDeatilsData extends StatelessWidget {
  final String title;
  final String dataDetails;

  const OrderItemDeatilsData({
    super.key,
    required this.title,
    required this.dataDetails,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: AppStyle.styleSRegular13(context)),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              dataDetails,
              textAlign: TextAlign.left,
              style: AppStyle.styleSemiBold13(context)
            ),
          ),
        ],
      ),
    );
  }
}
