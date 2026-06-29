import 'package:depifinalproject/core/utils/app_color.dart';
import 'package:depifinalproject/core/utils/app_style.dart';
import 'package:depifinalproject/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomProfileSecDetails extends StatelessWidget {
  const CustomProfileSecDetails({
    super.key,
    required this.title,
    required this.icon,
    this.iconcolor,
    this.onTap,
  });
  final String title;
  final IconData icon;
  final void Function()? onTap;
  final Color? iconcolor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Icon(
              
              icon,
              size: 22,
              color: iconcolor != null
                  ? iconcolor!
                  : AppColor.kPrimaryColor.withValues(alpha: 0.7),
            ),
            title: Text(
              title,
              style: AppStyle.styleSemiBold16(
                context,
              ).copyWith(color: const Color(0xFF949D9E)),
            ),
            trailing: SvgPicture.asset(Assets.imagesArrowRight),
          ),
          Divider(color: const Color(0xFFE0E0E0), thickness: 1, height: 4),
        ],
      ),
    );
  }
}
