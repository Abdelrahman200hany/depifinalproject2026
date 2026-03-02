import 'package:animate_do/animate_do.dart';
import 'package:depifinalproject/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    super.initState();
    _splashNavigation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const Color(0xE52D6CDF),
      body: Center(
        child: ZoomIn(
          curve: Curves.bounceIn,
          duration: Duration(seconds: 3),
          child: SizedBox(
            height: 150,
            width: 150,
            child: SvgPicture.asset(Assets.imagesLogo, fit: BoxFit.fill),
          ),
        ),
      ),
    );
  }

  void _splashNavigation() {
    Future.delayed(Duration(seconds: 4), () {
      // Navigator.pushReplacementNamed(context, SignView.routeName);
    });
  }
}