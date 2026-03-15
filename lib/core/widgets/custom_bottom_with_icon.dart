import 'package:depifinalproject/core/utils/app_style.dart';
import 'package:flutter/material.dart';


class CustomBottomWithICon extends StatelessWidget {
  const CustomBottomWithICon({
    super.key,
    required this.icon,
    required this.text,
    this.onTap,
  });
  final Widget icon;
  final String text;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      width: double.infinity,
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(16),
            side: BorderSide(width: 1, color: const Color(0xFFDCDEDE)),
          ),
        ),
        onPressed: onTap,

        child: ListTile(
          visualDensity: VisualDensity(vertical: VisualDensity.minimumDensity),
          leading: icon,
          title: Text(
            text,
            textAlign: TextAlign.center,

            style: AppStyle.styleBold16(
              context,
            ).copyWith(color: const Color(0xff0C0D0D)),
          ),
        ),
      ),
    );
  }
}
