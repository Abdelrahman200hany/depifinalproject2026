import 'package:flutter/material.dart';

class BottomNavigationBarItemModel {
  final IconData activeIcon, notActiveIcon;
  final String name;

  BottomNavigationBarItemModel({
    required this.notActiveIcon,
    required this.activeIcon,
    required this.name,
  });

  static List<BottomNavigationBarItemModel> get bottomNavigationBarItems => [
    BottomNavigationBarItemModel(
      activeIcon: Icons.home_outlined,
      notActiveIcon: Icons.home_sharp,
      name: 'الرئيسية',
    ),
    BottomNavigationBarItemModel(
      activeIcon: Icons.local_shipping_outlined,
      notActiveIcon: Icons.local_shipping_rounded,
      name: 'الطرود',
    ),
    BottomNavigationBarItemModel(
      activeIcon: Icons.local_offer_outlined,
      notActiveIcon: Icons.local_offer_rounded,
      name: 'عروضي',
    ),

    BottomNavigationBarItemModel(
      activeIcon: Icons.menu_open,
      notActiveIcon: Icons.menu_rounded,
      name: 'القائمة',
    ),
  ];
  // static List<BottomNavigationBarItemModel> get bottomNavigationBarItems => [
  //   BottomNavigationBarItemModel(
  //     activeIcon: Assets.imagesActiveHome,
  //     notActiveIcon: Assets.imagesNotActiveHome,
  //     name: 'الرئيسية',
  //   ),
  //   BottomNavigationBarItemModel(
  //     activeIcon: Assets.imagesActiveBox,
  //     notActiveIcon: Assets.imagesNotActiveBox,
  //     name: 'الطرود',
  //   ),
  //   BottomNavigationBarItemModel(
  //     activeIcon: Assets.imagesActiveBalance,
  //     notActiveIcon: Assets.imagesNotActiveBalance,
  //     name: 'الرصيد',
  //   ),

  //   BottomNavigationBarItemModel(
  //     activeIcon: Assets.imagesActiveProfile,
  //     notActiveIcon: Assets.imagesNotActiveProfile,
  //     name: 'حسابي',
  //   ),
  // ];
}
