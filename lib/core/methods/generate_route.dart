import 'package:depifinalproject/feature/auth/presentation/views/forget_password_view.dart';
import 'package:depifinalproject/feature/auth/presentation/views/sign_in_view.dart';
import 'package:depifinalproject/feature/auth/presentation/views/sign_up_view.dart';
import 'package:depifinalproject/feature/home/presentation/views/add_order.dart';
import 'package:depifinalproject/feature/home/presentation/views/home_view.dart';
import 'package:depifinalproject/feature/main_view/presentation/views/main_view.dart';
import 'package:depifinalproject/feature/offers/presentation/views/offer_view.dart';
import 'package:depifinalproject/feature/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:depifinalproject/feature/orders/presentation/views/order_delivery_view.dart';
import 'package:depifinalproject/feature/orders/presentation/views/order_details_view_for_clinet.dart';
import 'package:depifinalproject/feature/orders/presentation/views/order_details_view_for_delivery.dart';
import 'package:depifinalproject/feature/orders/presentation/views/order_clinet_view.dart';
import 'package:depifinalproject/feature/profile/presentaion/views/profile_view.dart';
import 'package:depifinalproject/feature/profile/presentaion/views/widgets/about_us_view_body.dart';
import 'package:depifinalproject/feature/splash/presentation/views/spalsh_view.dart';
import 'package:flutter/material.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (context) => const SplashView());
    case OnBoardingView.routeName:
      return MaterialPageRoute(builder: (context) => const OnBoardingView());
    case SignInView.routeName:
      return MaterialPageRoute(builder: (context) => const SignInView());
    case SignUpView.routeName:
      return MaterialPageRoute(builder: (context) => const SignUpView());
    case MainView.routeName:
      return MaterialPageRoute(builder: (context) => const MainView());
    case ForgetPasswordView.routeName:
      return MaterialPageRoute(
        builder: (context) => const ForgetPasswordView(),
      );
    case OrderDetailsViewForClinet.routeName:
      return MaterialPageRoute(
        builder: (context) => const OrderDetailsViewForClinet(),
      );
    case OrderDetailsViewForDelivery.routeName:
      return MaterialPageRoute(
        builder: (context) => const OrderDetailsViewForDelivery(),
      );
    case OrderClinetView.routeName:
      return MaterialPageRoute(builder: (context) => const OrderClinetView());
    case OrderDeliveryView.routeName:
      return MaterialPageRoute(builder: (context) => const OrderDeliveryView());

    case ProfileView.routeName:
      return MaterialPageRoute(builder: (context) => const ProfileView());
    case AboutUsViewBody.routeName:
      return MaterialPageRoute(builder: (context) => const AboutUsViewBody());
    case HomeView.routeName:
      return MaterialPageRoute(builder: (context) => const HomeView());
    case AddOrderView.routeName:
      return MaterialPageRoute(builder: (context) => const AddOrderView());

    case OfferView.routeName:
      return MaterialPageRoute(builder: (context) => const OfferView());

    default:
      return MaterialPageRoute(builder: (context) => const SplashView());
  }
}
