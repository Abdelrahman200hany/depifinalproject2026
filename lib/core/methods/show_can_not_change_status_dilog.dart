import 'package:depifinalproject/core/utils/app_color.dart';
import 'package:depifinalproject/core/utils/app_style.dart';
import 'package:depifinalproject/core/widgets/custom_text_bottom_with_background.dart';
import 'package:flutter/material.dart';

void showCannotChangeStatusDialog({required BuildContext context}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.warning_amber_rounded,
                size: 60,
                color: AppColor.kRatingColor,
              ),

              const SizedBox(height: 16),

              Text(
                "لا يمكن تغيير حالة الطرد في هذه المرحلة",
                textAlign: TextAlign.center,
                style: AppStyle.styleSemiBold18(
                  context,
                ).copyWith(color: Colors.black),
              ),

              const SizedBox(height: 25),

              CustomTextBottomWithBackground(
                text: "خروج",
                ontap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      );
    },
  );
}
