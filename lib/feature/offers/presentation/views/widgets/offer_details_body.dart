
import 'package:depifinalproject/core/utils/app_color.dart';
import 'package:depifinalproject/core/utils/app_style.dart';
import 'package:depifinalproject/core/utils/assets.dart';
import 'package:depifinalproject/core/widgets/custom_text_bottom_with_background.dart';
import 'package:flutter/material.dart';

class OfferDetailBody extends StatelessWidget {
  const OfferDetailBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: CircleAvatar(
            radius: 32,
            backgroundImage: AssetImage(Assets.imagesMyphoto),
          ),

          title: Text(
            'أحمد محمد',
            style: AppStyle.styleBold16(context).copyWith(color: Colors.black),
          ),

          subtitle: Row(
            children: [
              Icon(Icons.star, size: 16, color: Colors.amber),
              SizedBox(width: 4),
              Text('4.8', style: AppStyle.styleSRegular12(context)),
            ],
          ),

          trailing: Text(
            '50 جنيه',
            style: AppStyle.styleBold13(
              context,
            ).copyWith(color: AppColor.kPrimaryColor),
          ),
        ),

        const SizedBox(height: 8),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: CustomTextBottomWithBackground(text: 'قبول الطلب'),
        ),

        const SizedBox(height: 12),
      ],
    );
  }
}
