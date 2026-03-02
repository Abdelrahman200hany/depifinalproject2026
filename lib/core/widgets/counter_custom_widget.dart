import 'package:depifinalproject/core/utils/app_color.dart';
import 'package:flutter/material.dart';


class CounterCustomWidget extends StatelessWidget {
  const CounterCustomWidget({super.key, this.isIncrement = true ,this.onTap});
  final bool isIncrement;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap,
      child: Container(
        height: 28,
        width: 28,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: isIncrement ? AppColor.kPrimaryColordark : Colors.grey.shade300,
        ),
        child: Center(
          child: Icon(isIncrement ? Icons.add : Icons.remove,
              color: isIncrement ? Colors.white : Colors.black),
        ),
      ),
    );
  }
}
