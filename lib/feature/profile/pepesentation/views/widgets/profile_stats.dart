import 'package:depifinalproject/feature/profile/pepesentation/views/widgets/state_item.dart';
import 'package:flutter/material.dart';

class ProfileStats extends StatelessWidget {
  const ProfileStats({
    super.key,
    required this.numberOfreviews,
    required this.avgRate,
    required this.satisfactionRate,
  });
  final int numberOfreviews;
  final double avgRate;

  final double satisfactionRate;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,

      children: [
        StatItem(value: avgRate.toString(), title: "التقييم العام"),

        StatItem(value: numberOfreviews.toString(), title: "رحلة مكتملة"),

        StatItem(value: "% $satisfactionRate", title: "نسبة الرضا"),
      ],
    );
  }
}
