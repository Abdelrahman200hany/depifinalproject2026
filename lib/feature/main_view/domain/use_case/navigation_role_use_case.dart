import 'package:depifinalproject/feature/main_view/domain/repo/user_repo.dart';
import 'package:depifinalproject/feature/offers/presentation/views/offer_view_for_delivery.dart';
import 'package:flutter/material.dart';
import 'package:depifinalproject/core/consts/consts.dart';
import 'package:depifinalproject/feature/home/presentation/views/home_view.dart';
import 'package:depifinalproject/feature/offers/presentation/views/offer_view_for_client.dart';
import 'package:depifinalproject/feature/orders/presentation/views/order_delivery_view.dart';
import 'package:depifinalproject/feature/orders/presentation/views/order_clinet_view.dart';
import 'package:depifinalproject/feature/profile_setting/presentaion/views/profile_view.dart';

class GetMainScreensUseCase {
  final UserRepo userRepo;

  GetMainScreensUseCase(this.userRepo);

  List<Widget> call() {
    String userType = userRepo.getUserType();
    if (userType == kClinet) {
      return [
        HomeView(),
        OrderClinetView(),
        OfferViewforClinet(),
        ProfileView(),
      ];
    } else {
      return [HomeView(), OrderDeliveryView(), OfferViewForDelivery(), ProfileView()];
    }
  }
}
