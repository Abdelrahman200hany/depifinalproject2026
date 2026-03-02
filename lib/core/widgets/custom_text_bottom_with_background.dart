import 'package:depifinalproject/core/utils/app_color.dart';
import 'package:depifinalproject/core/utils/app_style.dart';
import 'package:flutter/material.dart';


class CustomTextBottomWithBackground extends StatelessWidget {
  const CustomTextBottomWithBackground({super.key, this.ontap, required this.text});
  final void Function()? ontap;
  final String text;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 54,
      width: double.infinity,
      child: TextButton(
        onPressed: ontap,
        style: TextButton.styleFrom(
          backgroundColor:AppColor.kPrimaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(16),
          ),
        ),
        child: Center(
          child: Text(text, style: AppStyle.styleBold16(context)),
        ),
      ),
    );
  }
}
