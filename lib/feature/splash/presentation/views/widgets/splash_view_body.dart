import 'package:animate_do/animate_do.dart';
import 'package:depifinalproject/core/consts/consts.dart';
import 'package:depifinalproject/core/serviecs/auth_services/fire_base_auth_services.dart';
import 'package:depifinalproject/core/serviecs/shared_prefs_services/shared_prefs.dart';
import 'package:depifinalproject/core/utils/assets.dart';
import 'package:depifinalproject/feature/auth/presentation/views/sign_in_view.dart';
import 'package:depifinalproject/feature/main_view/presentation/views/main_view.dart';
import 'package:depifinalproject/feature/on_boarding/presentation/views/on_boarding_view.dart';
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
      backgroundColor: const Color(0xE52D6CDF),
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
    final bool isOnBoardingSeen = Prefs.getBool(kOnBoadrdingViewSeen);

    Future.delayed(Duration(seconds: 4), () async {
      if (isOnBoardingSeen) {
        bool ifUserSignIn = await FirebaseAuthServiecs().isSignedIn();
        if (ifUserSignIn) {
          Navigator.pushReplacementNamed(context, MainView.routeName);
        } else {
          Navigator.pushReplacementNamed(context, SignInView.routeName);
        }
      } else {
        Navigator.pushReplacementNamed(context, OnBoardingView.routeName);
      }
    });
  }
}
