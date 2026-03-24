import 'package:depifinalproject/core/utils/app_color.dart';
import 'package:flutter/material.dart';

class CustomChekedBox extends StatefulWidget {
  const CustomChekedBox({super.key, required this.onChanged});
  final ValueChanged<bool> onChanged;

  @override
  State<CustomChekedBox> createState() => _CustomChekedBoxState();
}

class _CustomChekedBoxState extends State<CustomChekedBox> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      activeColor: AppColor.kPrimaryColor,
      value: isChecked,
      onChanged: (value) {
        isChecked = value!;
        widget.onChanged(isChecked);
        setState(() {});
      },
    );
  }
}
