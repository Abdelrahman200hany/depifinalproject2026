
import 'package:flutter/material.dart';

class CustomOrderHeaderDataDetails extends StatelessWidget {
  const CustomOrderHeaderDataDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: Colors.orange[50],
              // لون قريب من "في انتظار العروض"
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text(
              'في انتظار العروض',
              style: TextStyle(color: Colors.orange),
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'SH-2025-0012',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          const Text(
            '12 أكتوبر 2025',
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
          const SizedBox(height: 10),
          const Text('الرياض', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 5),
          const Text('جدة'),
        ],
      ),
    );
  }
}
