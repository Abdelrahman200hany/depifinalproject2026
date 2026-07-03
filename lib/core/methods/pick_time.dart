import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Future<void> pickTime(BuildContext context, ValueChanged<String> time) async {
  TimeOfDay? pickedTime = await showTimePicker(
    // barrierColor: AppColor.kPrimaryColor,

    context: context,
    initialTime: TimeOfDay.now(),
    helpText: "اختر الوقت المناسب",
    cancelText: "الغاء",
    confirmText: "تاكيد",
  );

  if (pickedTime != null) {
    final now = DateTime.now();

    final dateTime = DateTime(
      now.year,
      now.month,
      now.day,
      pickedTime.hour,
      pickedTime.minute,
    );

    String formattedTime = DateFormat('HH:mm').format(dateTime);

    time(formattedTime);
  }
}
