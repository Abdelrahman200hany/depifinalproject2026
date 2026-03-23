import 'package:depifinalproject/core/utils/app_color.dart';
import 'package:depifinalproject/core/utils/app_style.dart';
import 'package:flutter/material.dart';

class CustomTextFormFeild extends StatelessWidget {
  const CustomTextFormFeild({
    super.key,
    this.hint,
    this.suffixIcon,
    required this.textInputType,
    this.isHidden = false,
    this.onSaved,
    this.labelText,
    this.validator,
    this.controller,
  });

  final String? hint;
  final String? labelText;
  final IconButton? suffixIcon;
  final TextInputType textInputType;
  final bool isHidden;
  final String? Function(String?)? validator;

  final void Function(String?)? onSaved;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 54,
      width: double.infinity,
      child: TextFormField(
        controller: controller,
        validator: validator,
        onSaved: onSaved,
        cursorColor: AppColor.kPrimaryColor,
        obscureText: isHidden,
        keyboardType: textInputType,
        decoration: InputDecoration(
          labelText: labelText,
          fillColor: const Color(0xffF9FAFA),
          labelStyle: AppStyle.styleBold13(context),
          filled: true,
          hintText: hint,
          hintStyle: AppStyle.styleBold13(context),
          suffixIcon: suffixIcon,

          border: buildBoreder(),

          enabledBorder: buildBoreder(),
          focusedBorder: buildBoreder().copyWith(
            borderSide: BorderSide(width: 1, color: AppColor.kPrimaryColor),
          ),
        ),
      ),
    );
  }
}

OutlineInputBorder buildBoreder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    borderSide: BorderSide(width: 1, color: const Color(0xFFE6E9E9)),
  );
}
