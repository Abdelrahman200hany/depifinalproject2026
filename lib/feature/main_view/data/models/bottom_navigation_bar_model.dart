import 'package:depifinalproject/core/utils/assets.dart';

class BottomNavigationBarItemModel {
  final String activeIcon, notActiveIcon;
  final String name;

  BottomNavigationBarItemModel({
    required this.notActiveIcon,
    required this.activeIcon,
    required this.name,
  });

  static List<BottomNavigationBarItemModel> get bottomNavigationBarItems => [
    BottomNavigationBarItemModel(
      activeIcon: Assets.imagesActiveHome,
      notActiveIcon: Assets.imagesNotActiveHome,
      name: 'الرئيسية',
    ),
    BottomNavigationBarItemModel(
      activeIcon: Assets.imagesActiveBox,
      notActiveIcon: Assets.imagesNotActiveBox,
      name: 'الطرود',
    ),
    BottomNavigationBarItemModel(
      activeIcon: Assets.imagesActiveBalance,
      notActiveIcon: Assets.imagesNotActiveBalance,
      name: 'الرصيد',
    ),

    BottomNavigationBarItemModel(
      activeIcon: Assets.imagesActiveProfile,
      notActiveIcon: Assets.imagesNotActiveProfile,
      name: 'حسابي',
    ),
  ];
}
