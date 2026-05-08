import 'package:depifinalproject/core/consts/consts.dart';
import 'package:depifinalproject/core/utils/app_color.dart';
import 'package:flutter/material.dart';

Color getOrderStateColor(String state, double opactiy) {
  if (state == kstatusWaiting) {
    return Colors.green.withValues(alpha: opactiy);
  } else if (state == kstatusDelivered) {
    return AppColor.kPrimaryColor.withValues(alpha: opactiy);
  } else if (state == kstatusOnWay) {
    return AppColor.ksecondaryColor.withValues(alpha: opactiy);
  } else {
    return AppColor.kRatingColor.withValues(alpha: opactiy);
  }
}
