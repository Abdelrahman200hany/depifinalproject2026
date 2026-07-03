import 'package:depifinalproject/core/utils/app_color.dart';
import 'package:depifinalproject/core/utils/app_style.dart';
import 'package:depifinalproject/core/widgets/custom_text_bottom_with_background.dart';
import 'package:depifinalproject/core/widgets/custom_text_form_feild.dart';
import 'package:flutter/material.dart';

void showRejectReasonDialog({
  required BuildContext context,
  required Function(String reason) onConfirm,
}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) {
      return RejectReasonDialog(onConfirm: onConfirm);
    },
  );
}

class RejectReasonDialog extends StatefulWidget {
  const RejectReasonDialog({super.key, required this.onConfirm});

  final Function(String reason) onConfirm;

  @override
  State<RejectReasonDialog> createState() => _RejectReasonDialogState();
}

class _RejectReasonDialogState extends State<RejectReasonDialog> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController controller = TextEditingController();

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
          key: formKey,
          autovalidateMode: autovalidateMode,

          child: Column(
            mainAxisSize: MainAxisSize.min,

            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  Text(
                    "سبب الرفض",
                    style: AppStyle.styleSemiBold18(
                      context,
                    ).copyWith(color: Colors.black),
                  ),

                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.close, color: AppColor.kRatingColor),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              CustomTextFormFeild(
                controller: controller,
                maxLines: 4,
                textInputType: TextInputType.multiline,
                hint: "اكتب سبب الرفض",
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "يرجى كتابة سبب الرفض";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 20),

              CustomTextBottomWithBackground(
                text: "تأكيد",

                ontap: () {
                  if (formKey.currentState!.validate()) {
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
