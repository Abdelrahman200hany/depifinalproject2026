import 'package:depifinalproject/core/utils/app_color.dart';
import 'package:depifinalproject/core/utils/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomProfileSecDetailswithSwitchBottom extends StatefulWidget {
  const CustomProfileSecDetailswithSwitchBottom({
    super.key,
    required this.title,
    required this.image,
    this.onTap,
  });
  final String title, image;
  final void Function()? onTap;

  @override
  State<CustomProfileSecDetailswithSwitchBottom> createState() =>
      _CustomProfileSecDetailswithSwitchBottomState();
}

class _CustomProfileSecDetailswithSwitchBottomState
    extends State<CustomProfileSecDetailswithSwitchBottom> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          leading: SvgPicture.asset(
            widget.image,
            colorFilter: ColorFilter.mode(
              AppColor.kPrimaryColor.withValues(alpha: 0.7),
              BlendMode.srcIn,
            ),
          ),
          title: Text(
            widget.title,
            style: AppStyle.styleSemiBold16(
              context,
            ).copyWith(color: const Color(0xFF949D9E)),
          ),
          trailing: Switch(
            value: isSwitched,
            onChanged: (val) {
              isSwitched = val;
              setState(() {});
            },
          ),
        ),
        Divider(color: const Color(0xFFE0E0E0), thickness: 1, height: 4),
      ],
    );
  }
}
