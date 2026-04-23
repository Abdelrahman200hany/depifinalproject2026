import 'package:depifinalproject/core/consts/consts.dart';
import 'package:depifinalproject/core/methods/get_user_local_data.dart';
import 'package:depifinalproject/feature/home/presentation/views/home_view.dart';
import 'package:depifinalproject/feature/offers/presentation/views/offer_view.dart';
import 'package:depifinalproject/feature/orders/presentation/views/order_delivery_view.dart';
import 'package:depifinalproject/feature/orders/presentation/views/order_clinet_view.dart';
import 'package:depifinalproject/feature/profile/presentaion/views/profile_view.dart';
import 'package:flutter/material.dart';

List<Widget> getMainViewList() {
  if (getUserData().userType != kClinet) {
    return [SizedBox(), OrderDeliveryView(), SizedBox(), ProfileView()];
  } else {
    return [HomeView(), OrderClinetView(), OfferView(), ProfileView()];
  }
}
