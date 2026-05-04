import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

Future<void> pickDate(BuildContext context, ValueChanged<String> date) async {
  DateTime? pickedDate = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(2000),
    lastDate: DateTime(2100),
    cancelText: "Cancel",
    confirmText: "Ok",
    helpText: "اختر التاريخ المناسب",
    initialEntryMode: DatePickerEntryMode.calendar,
  );
  if (pickedDate != null) {
    String formatedDate = DateFormat('yy-MM-dd').format(pickedDate);
    date(formatedDate);
  }
}

