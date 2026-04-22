import 'package:depifinalproject/core/utils/app_color.dart';
import 'package:depifinalproject/core/utils/app_style.dart';
import 'package:depifinalproject/core/widgets/custom_text_bottom_with_background.dart';
import 'package:flutter/material.dart';

void showPop({
  required BuildContext context,
  required String title,
  required String content,
  required VoidCallback onConfirm,
}) {
  showDialog(
    context: context,
    // يمنع القفل بالضغط بره
    barrierDismissible: false,
    builder: (context) {
      return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ///  Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: AppStyle.styleSemiBold18(
                      context,
                    ).copyWith(color: Colors.black),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.close, color: AppColor.kRatingColor),
                  ),
                ],
              ),

              SizedBox(height: 10),

              ///  Content
              Text(content, textAlign: TextAlign.center),

              SizedBox(height: 20),

              ///  Bottom Button
              CustomTextBottomWithBackground(text: 'تاكيد', ontap: onConfirm),
            ],
          ),
        ),
      );
    },
  );
}
