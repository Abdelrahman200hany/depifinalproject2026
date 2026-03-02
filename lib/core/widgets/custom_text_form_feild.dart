import 'package:depifinalproject/core/utils/app_style.dart';
import 'package:flutter/material.dart';


class CustomTextFormFeild extends StatelessWidget {
  const CustomTextFormFeild({
    super.key,
    required this.hint,
    this.suffixIcon,
    required this.textInputType,
    this.isHidden = false, this.onSaved,
  });

  final String hint;
  final IconButton? suffixIcon;
  final TextInputType textInputType;
  final bool isHidden;

final void Function(String?)? onSaved;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 54,
      width: double.infinity,
      child: TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'هذا الحقل مطلوب';
          } else {
            return null;
          }
        },
        onSaved:onSaved ,
        obscureText: isHidden,
        keyboardType: textInputType,
        decoration: InputDecoration(
          fillColor: const Color(0xffF9FAFA),

          filled: true,
          hintText: hint,
          hintStyle: AppStyle.styleBold13(context),
          suffixIcon: suffixIcon,

          border: buildBoreder(),

          enabledBorder: buildBoreder(),
          focusedBorder: buildBoreder(),
        ),
      ),
    );
  }
}

OutlineInputBorder buildBoreder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(4),
    borderSide: BorderSide(width: 1, color: const Color(0xFFE6E9E9)),
  );
}
