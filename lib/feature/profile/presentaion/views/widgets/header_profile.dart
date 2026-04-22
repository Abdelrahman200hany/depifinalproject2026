import 'package:depifinalproject/core/methods/get_user_local_data.dart';
import 'package:depifinalproject/core/utils/app_style.dart';
import 'package:depifinalproject/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Headerprofile extends StatelessWidget {
  const Headerprofile({super.key, this.onTap});
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: onTap,
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xFFF9FAFA),
                  // borderRadius: BorderRadius.circular(24),
                  image: DecorationImage(
                    image: AssetImage(Assets.imagesMyphoto),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              Positioned(
                left: 0,
                right: 0,
                bottom: -15,

                child: Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    shape: BoxShape.circle,
                  ),
                  child: Center(child: SvgPicture.asset(Assets.imagesCamera)),
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,

          children: [
            Text(
              getUserData().name,
              style: AppStyle.styleBold13(
                context,
              ).copyWith(color: Colors.black),
            ),

            SizedBox(height: 6),
            Text(getUserData().email, style: AppStyle.styleSRegular13(context)),
          ],
        ),
      ],
    );
  }
}
