 import 'package:depifinalproject/core/methods/get_user_local_data.dart';
import 'package:depifinalproject/feature/home/presentation/views/home_view.dart';
import 'package:depifinalproject/feature/offers/presentation/views/offer_view.dart';
import 'package:depifinalproject/feature/orders/presentation/views/order_view.dart';
import 'package:depifinalproject/feature/profile/presentaion/views/profile_view.dart';
import 'package:flutter/material.dart';

List<Widget> getMainViewList() {
    if (getUserData().userType == 'مندوب') {
    return [SizedBox(), SizedBox(), SizedBox(), ProfileView()];
  }
  else{
  return  [HomeView(), OrderView(), OfferView(), ProfileView()];
  }
}