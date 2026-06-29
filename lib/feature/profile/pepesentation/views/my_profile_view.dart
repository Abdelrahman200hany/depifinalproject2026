import 'package:depifinalproject/feature/profile/pepesentation/views/widgets/my_profie_info.dart';
import 'package:depifinalproject/feature/profile/pepesentation/views/widgets/my_profile_heeader.dart';
import 'package:flutter/material.dart';

class MyProfileView extends StatelessWidget {
  const MyProfileView({super.key});
  static const String routeName = 'MyProfileView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF7F9FC),
      

      body: SafeArea(
        child: const SingleChildScrollView(
          physics: BouncingScrollPhysics(),
        
          child: Column(
            children: [
              ProfileHeader(),
        
              SizedBox(height: 20),
        
              ProfileInfo(),
        
              SizedBox(height: 25),
        
              ProfileStats(),
        
              SizedBox(height: 30),
        
              ReviewsSection(),
        
              SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}

// ================= HEADER =================


// ================= PROFILE INFO =================

// ================= STATS =================

class ProfileStats extends StatelessWidget {
  const ProfileStats({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,

      children: const [
        StatItem(value: "4.9", title: "التقييم العام"),

        StatItem(value: "+1.2k", title: "رحلة مكتملة"),

        StatItem(value: "98%", title: "نسبة الرضا"),
      ],
    );
  }
}

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

// ================= REVIEWS =================

class ReviewsSection extends StatelessWidget {
  const ReviewsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              Text(
                "آراء العملاء",

                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),

              Text("عرض الكل", style: TextStyle(color: Color(0xff1E6DEB))),
            ],
          ),
        ),

        ReviewCard(
          name: "سارة خالد",

          rating: "5.0",

          time: "منذ ساعتين",

          review: "توصيل سريع جداً والتعامل ممتاز",
        ),

        ReviewCard(
          name: "محمد العتيبي",

          rating: "4.8",

          time: "أمس",

          review: "خدمة ممتازة والتزام بالمواعيد",
        ),
      ],
    );
  }
}

class ReviewCard extends StatelessWidget {
  final String name;

  final String rating;

  final String time;

  final String review;

  const ReviewCard({
    super.key,

    required this.name,

    required this.rating,

    required this.time,

    required this.review,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),

      padding: const EdgeInsets.all(16),

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius: BorderRadius.circular(16),

        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 8)],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Text(
            name,

            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),

          const SizedBox(height: 5),

          Text("⭐ $rating  •  $time"),

          const SizedBox(height: 10),

          Text(review),
        ],
      ),
    );
  }
}

// ================= BOTTOM NAV =================
