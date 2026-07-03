import 'package:depifinalproject/feature/profile/domain/entity/rate_entity.dart';
import 'package:flutter/material.dart';

class ReviewCard extends StatelessWidget {
  final RateEntity itemRate;

  const ReviewCard({super.key, required this.itemRate});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,

      margin: const EdgeInsets.all(12),

      padding: const EdgeInsets.all(12),

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius: BorderRadius.circular(16),

        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 8)],
      ),

      child: ListTile(
        contentPadding: EdgeInsets.zero,

        leading: CircleAvatar(
          radius: 28,

          backgroundImage: NetworkImage(itemRate.user.imageUrl),

          onBackgroundImageError: (_, __) {},
        ),

        title: Text(
          itemRate.user.name,

          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),

        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            const SizedBox(height: 5),

            Row(
              children: List.generate(5, (index) {
                return Icon(
                  Icons.star,

                  size: 18,

                  color: index < itemRate.rate ? Colors.orange : Colors.grey,
                );
              }),
            ),

            const SizedBox(height: 8),

            Text(itemRate.rateString, style: const TextStyle(fontSize: 14)),
          ],
        ),
      ),
    );
  }
}
