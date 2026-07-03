import 'package:depifinalproject/core/utils/app_color.dart';
import 'package:depifinalproject/core/utils/app_style.dart';
import 'package:depifinalproject/core/utils/app_validation.dart';
import 'package:depifinalproject/core/widgets/custom_text_bottom_with_background.dart';
import 'package:depifinalproject/core/widgets/custom_text_form_feild.dart';
import 'package:flutter/material.dart';

void showCompleteOrderAppTextInputDialog({
  required BuildContext context,
  required String title,
  int maxLine = 1,
  required String codeDelivery,
  required Function(String text) onConfirm,
  String hintText = "اكتب هنا...",
}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) {
      return AppTextInputDialog(
        codeDelivery: codeDelivery,
        maxLine: maxLine,
        title: title,
        // content: content,
        hintText: hintText,
        onConfirm: onConfirm,
      );
    },
  );
}

class AppTextInputDialog extends StatefulWidget {
  final String title;
  final int maxLine;
  final String hintText;
  final String codeDelivery;
  final Function(String text) onConfirm;

  const AppTextInputDialog({
    super.key,
    required this.maxLine,
    required this.title,
    required this.onConfirm,
    required this.hintText,
    required this.codeDelivery,
  });

  @override
  State<AppTextInputDialog> createState() => _AppTextInputDialogState();
}

class _AppTextInputDialogState extends State<AppTextInputDialog> {
  GlobalKey<FormState> formkey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),

      child: Padding(
        padding: const EdgeInsets.all(16),

        child: Form(
          key: formkey,
          autovalidateMode: autovalidateMode,
          child: Column(
            mainAxisSize: MainAxisSize.min,

            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  Text(
                    widget.title,
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

              const SizedBox(height: 10),

              // Text(widget.content, textAlign: TextAlign.center),

              // const SizedBox(height: 15),
              CustomTextFormFeild(
                maxLines: widget.maxLine,
                controller: controller,
                textInputType: TextInputType.number,
                hint: widget.hintText,
                validator: (value) => AppValidation.deliveryCode(
                  correctCode: widget.codeDelivery,
                  value,
                ),
              ),
              const SizedBox(height: 20),

              CustomTextBottomWithBackground(
                text: "تأكيد",

                ontap: () {
                  if (formkey.currentState!.validate()) {
                    formkey.currentState!.save();
                    widget.onConfirm(controller.text.trim());
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }

                  // Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
