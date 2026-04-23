
import 'package:depifinalproject/core/utils/app_color.dart';
import 'package:flutter/material.dart';

class TopHeadModelSheetLine extends StatelessWidget {
  const TopHeadModelSheetLine({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        height: 12,
        width: 180,
        decoration: BoxDecoration(
          color: AppColor.kPrimaryColor,
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(8),
            bottomLeft: Radius.circular(8),
          ),
        ),
      ),
    );
  }
}
