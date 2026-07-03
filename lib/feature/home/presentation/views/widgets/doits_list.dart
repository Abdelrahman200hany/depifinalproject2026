import 'package:depifinalproject/core/widgets/custom_doits_indecator.dart';
import 'package:flutter/material.dart';

class DoitsList extends StatelessWidget {
  const DoitsList({
    super.key,
    required this.isActive,
    required this.itemsListcounter,
  });
  final int isActive;
  final int itemsListcounter;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        itemsListcounter,
        (index) => Padding(
          padding: const EdgeInsets.only(right: 4),
          child: CustomDoitsIndecator(isActive: isActive == index),
        ),
      ),
    );
  }
}
