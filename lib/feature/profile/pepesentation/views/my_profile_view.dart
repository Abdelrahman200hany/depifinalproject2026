import 'package:depifinalproject/feature/profile/pepesentation/views/widgets/my_profie_info.dart';
import 'package:depifinalproject/feature/profile/pepesentation/views/widgets/my_profile_heeader.dart';
import 'package:depifinalproject/feature/profile/pepesentation/views/widgets/reviews_view_details.dart';
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
              ReviewViewDetails(),
              SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}
