import 'package:depifinalproject/core/consts/consts.dart';
import 'package:depifinalproject/core/utils/app_color.dart';
import 'package:depifinalproject/core/widgets/custom_app_bar.dart';
import 'package:depifinalproject/feature/orders/domain/entity/delivery_entity.dart';
import 'package:depifinalproject/feature/profile/pepesentation/views/widgets/review_view_details_for_other.dart';
import 'package:flutter/material.dart';

class OtherProfileUserViewBody extends StatelessWidget {
  const OtherProfileUserViewBody({super.key, required this.delivery});

  final DeliveryEntity delivery;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'تقيمات', wantedIconBack: true),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: kHoriztailPadding),
        child: SingleChildScrollView(
          child: Column(
            children: [
                                SizedBox(height: 16),

              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadiusGeometry.circular(32),
                    child: CircleAvatar(
                      radius: 55,

                      // backgroundColor: Color(0xff041C24),
                      backgroundImage: NetworkImage(delivery.driver.imageUrl),
                    ),
                  ),

                  Positioned(
                    right: 5,

                    bottom: 5,

                    child: CircleAvatar(
                      radius: 12,

                      backgroundColor: delivery.driver.isValided == true
                          ? Colors.blue
                          : AppColor.kGreyAppColor,

                      child: const Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 15,
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  SizedBox(height: 16),

                  Text(
                    delivery.driver.name,

                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),

                  SizedBox(height: 5),

                  Text(
                    delivery.driver.userType,

                    style: TextStyle(color: Color(0xff1E6DEB), fontSize: 15),
                  ),
                ],
              ),
              SizedBox(height: 45),
              ReviewViewDetailsforOthers(userID: delivery.driver.userID!),
            ],
          ),
        ),
      ),
    );
  }
}
