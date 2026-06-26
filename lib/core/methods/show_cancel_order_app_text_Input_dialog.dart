import 'package:depifinalproject/core/utils/app_color.dart';
import 'package:depifinalproject/core/utils/app_style.dart';
import 'package:depifinalproject/core/utils/app_validation.dart';
import 'package:depifinalproject/core/widgets/custom_text_bottom_with_background.dart';
import 'package:depifinalproject/core/widgets/custom_text_form_feild.dart';
import 'package:flutter/material.dart';

void showCancelOrderAppTextInputDialog({
  required BuildContext context,
  required String title,
  required Function(String text) onConfirm,
  int maxLine = 1,
  String hintText = "اكتب هنا...",
}) {
  showDialog(
    context: context,
    barrierDismissible: false,

    builder: (_) {
      return CancelOrderAppTextInputDialog(
        maxLine: maxLine,

        title: title,

        hintText: hintText,

        onConfirm: onConfirm,
      );
    },
  );
}

class CancelOrderAppTextInputDialog extends StatefulWidget {
  final String title;
  final int maxLine;
  final String hintText;
  final Function(String text) onConfirm;

  const CancelOrderAppTextInputDialog({
    super.key,

    required this.title,

    required this.maxLine,

    required this.hintText,

    required this.onConfirm,
  });

  @override
  State<CancelOrderAppTextInputDialog> createState() =>
      _CancelOrderAppTextInputDialogState();
}

class _CancelOrderAppTextInputDialogState
    extends State<CancelOrderAppTextInputDialog> {
  final TextEditingController controller = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

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

              CustomTextFormFeild(
                hint: widget.hintText,
                textInputType: TextInputType.text,
                controller: controller,
                validator: (p0) => AppValidation.description(p0),
                maxLines: widget.maxLine,
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
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
