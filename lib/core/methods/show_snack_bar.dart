import 'package:depifinalproject/core/utils/app_color.dart';
import 'package:flutter/material.dart';

void showSuccessSnackBar(context, {required String message}) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 2),

        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        margin: EdgeInsets.all(12),
        content: Center(
          child: Text(message, style: TextStyle(color: Colors.white)),
        ),
        backgroundColor: AppColor.kPrimaryColor,
      ),
    );
}

void showfaulireSnackBar(context, {required String message}) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        margin: EdgeInsets.all(12),
        backgroundColor: AppColor.kRatingColor,
        content: Center(
          child: Text(message, style: TextStyle(color: Colors.white)),
        ),
      ),
    );
}
