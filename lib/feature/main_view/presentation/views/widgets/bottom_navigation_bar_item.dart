import 'package:depifinalproject/feature/main_view/data/models/bottom_navigation_bar_model.dart';
import 'package:depifinalproject/feature/main_view/presentation/views/widgets/acitve_bottom_navigation_bar_item.dart';
import 'package:depifinalproject/feature/main_view/presentation/views/widgets/not_active_bottom_navigation_bar_item.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigationBarItem extends StatelessWidget {
  const CustomBottomNavigationBarItem({
    super.key,
    required this.isActive,
    required this.item,
  });
  final bool isActive;
  final BottomNavigationBarItemModel item;

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      firstChild: ActiveBottomNavigationBarItem(
        activeIcon: item.activeIcon,
        name: item.name,
      ),
      secondChild: NotActiveBottomNavigationBarItem(
        notActiveIcon: item.notActiveIcon,
      ),
      crossFadeState: isActive
          ? CrossFadeState.showFirst
          : CrossFadeState.showSecond,
      duration: Duration(milliseconds: 100),
      firstCurve: Curves.easeIn,
      secondCurve: Curves.easeOut,
    );
  }
}
