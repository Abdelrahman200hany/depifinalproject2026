import 'package:depifinalproject/core/methods/get_user_local_data.dart';
import 'package:depifinalproject/core/utils/assets.dart';
import 'package:depifinalproject/feature/profile/pepesentation/views/update_profile_view.dart';
import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,

      clipBehavior: Clip.none,
      children: [
        Container(
          height: 180,

          width: double.infinity,

          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(12),
              bottomRight: Radius.circular(12),
            ),
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(Assets.imagesBannerProfile),
            ),
            // color: Color(0xffDCE9FF),
          ),
        ),
        Positioned(
          top: 16,
          left: 16,
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_circle_left_rounded,
              color: Colors.white,
              size: 34,
            ),
          ),
        ),

        Positioned(
          top: 16,
          right: 16,
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, UpdataProfileView.routeName);
            },
            child: Icon(
              Icons.wifi_protected_setup,
              color: Colors.white,
              size: 34,
            ),
          ),
        ),

        Positioned(
          bottom: -50,

          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(32),
                child: CircleAvatar(
                  radius: 55,

                  backgroundColor: Color(0xff041C24),

                  child: Image.network(getUserData().imageUrl),
                ),
              ),

              Visibility(
                visible: getUserData().isValided == true ? true : false,
                child: Positioned(
                  right: 5,

                  bottom: 5,

                  child: CircleAvatar(
                    radius: 12,

                    backgroundColor: Colors.blue,

                    child: const Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 15,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
