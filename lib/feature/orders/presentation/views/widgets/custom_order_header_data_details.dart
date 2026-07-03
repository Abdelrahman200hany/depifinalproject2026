import 'package:depifinalproject/core/methods/cut_srting.dart';
import 'package:depifinalproject/core/methods/get_order_state_color.dart';
import 'package:flutter/material.dart';

class CustomOrderHeaderDataDetails extends StatelessWidget {
  const CustomOrderHeaderDataDetails({
    super.key,
    required this.status,
    required this.orderId,
    required this.data,
    required this.from,
    required this.to,
  });

  final String status, orderId, data, from, to;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: getOrderStateColor(status, 0.4),
              // لون قريب من "في انتظار العروض"
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              status,
              style: TextStyle(color: getOrderStateColor(status, 1)),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            '#Fl-${cutString(orderId, maxLength: 12)}',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          Text(data, style: TextStyle(color: Colors.grey, fontSize: 12)),
          const SizedBox(height: 10),
          Text(from, style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 5),
          Text(to),
        ],
      ),
    );
  }
}
