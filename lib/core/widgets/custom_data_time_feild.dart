import 'package:depifinalproject/core/utils/app_color.dart';
import 'package:depifinalproject/core/utils/app_style.dart';
import 'package:flutter/material.dart';

class CustomDateTimeField extends StatelessWidget {
  const CustomDateTimeField({
    super.key,
    required this.controller,
    required this.onTap,
    this.hint,
    this.labelText,
    this.suffixIcon,
    this.validator,
  });

  final TextEditingController controller;
  final VoidCallback onTap;

  final String? hint;
  final String? labelText;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextFormField(
        validator: validator,
        controller: controller,
        readOnly: true,
        onTap: onTap,
        cursorColor: AppColor.kPrimaryColor,
        style: AppStyle.styleBold13(context),

        decoration: InputDecoration(
          labelText: labelText,
          hintText: hint,

          filled: true,
          fillColor: const Color(0xffF9FAFA),

          labelStyle: AppStyle.styleBold13(context),
          hintStyle: AppStyle.styleBold13(context),

          suffixIcon: suffixIcon,

          border: buildBorder(),

          enabledBorder: buildBorder(),

          focusedBorder: buildBorder().copyWith(
            borderSide: BorderSide(width: 1, color: AppColor.kPrimaryColor),
          ),
        ),
      ),
    );
  }
}

OutlineInputBorder buildBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    borderSide: const BorderSide(width: 1, color: Color(0xFFE6E9E9)),
  );
}
