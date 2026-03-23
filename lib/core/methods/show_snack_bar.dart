import 'package:depifinalproject/core/utils/app_color.dart';
import 'package:flutter/material.dart';

void showSuccessSnackBar(context, {required String message}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message, style: TextStyle(color: Colors.white)),
      backgroundColor: AppColor.kPrimaryColor,
    ),
  );
}

void showfaulireSnackBar(context, {required String message}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: AppColor.kRatingColor,
      content: Text(message, style: TextStyle(color: Colors.white)),
    ),
  );
}
