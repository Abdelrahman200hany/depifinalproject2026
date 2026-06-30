import 'package:depifinalproject/feature/profile/domain/entity/rate_entity.dart';
import 'package:depifinalproject/feature/profile/pepesentation/views/widgets/rate_list.dart';
import 'package:depifinalproject/feature/profile/pepesentation/views/widgets/rate_list_with_all_review.dart';
import 'package:flutter/material.dart';

class ReviewsSection extends StatelessWidget {
  const ReviewsSection({super.key, required this.rateList});
  final List<RateEntity> rateList;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              Text(
                "آراء العملاء",

                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),

              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    RateListWithAllReview.routeName,
                    arguments: rateList,
                  );
                },
                child: Text(
                  "عرض الكل",
                  style: TextStyle(color: Color(0xff1E6DEB)),
                ),
              ),
            ],
          ),
        ),

        RateListwithLimitReviews(rateList: rateList),
      ],
    );
  }
}
