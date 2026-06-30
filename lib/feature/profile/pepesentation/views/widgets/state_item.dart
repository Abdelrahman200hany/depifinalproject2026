import 'package:flutter/material.dart';

class StatItem extends StatelessWidget {
  final String value;

  final String title;

  const StatItem({super.key, required this.value, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,

          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),

        const SizedBox(height: 5),

        Text(title, style: const TextStyle(color: Colors.grey, fontSize: 13)),
      ],
    );
  }
}
