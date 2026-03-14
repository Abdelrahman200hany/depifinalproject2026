import 'package:depifinalproject/core/widgets/custom_doits_indecator.dart';
import 'package:flutter/material.dart';

class DoitsList extends StatelessWidget {
  const DoitsList({super.key, required this.currentPageIndecator});
  final int currentPageIndecator;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      spacing: 4,
      children: List.generate(
        3,
        (index) =>
            CustomDoitsIndecator(isActive: currentPageIndecator == index),
      ),
    );
  }
}
