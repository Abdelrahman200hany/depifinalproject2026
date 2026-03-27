import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:depifinalproject/core/utils/app_color.dart';
import 'package:depifinalproject/core/utils/app_style.dart';
import 'package:flutter/material.dart';

class CustomButtonsBarForOrderView extends StatelessWidget {
  const CustomButtonsBarForOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return ButtonsTabBar(
      labelStyle: AppStyle.styleSemiBold16(context).copyWith(color: Colors.white),
      unselectedLabelStyle: AppStyle.styleSemiBold16(
        context,
      ).copyWith(color: AppColor.kPrimaryColor),
      buttonMargin: EdgeInsets.all(4),
      contentPadding: EdgeInsets.only(top: 2, bottom: 2, right: 24, left: 24),
      borderWidth: 0.5,
      borderColor: Colors.white,
      unselectedBorderColor: AppColor.kPrimaryColordLight.withValues(alpha: 0.5),

      splashColor: const Color.fromARGB(255, 36, 248, 248),
      physics: BouncingScrollPhysics(),
      contentCenter: true,

      decoration: BoxDecoration(
        color: Colors.blue[600],
        borderRadius: BorderRadius.circular(10),
      ),
      unselectedDecoration: BoxDecoration(
        color: Colors.white,

        borderRadius: BorderRadius.circular(10),
      ),

      tabs: List.generate(3, (index) => Tab(text: 'في الطريق الي العميل ')),

      //  [
      //   Tab(text: 'الكل'),
      //   Tab(text: 'في اتظار المندوب'),
      //   Tab(text: 'في الطريق الي العميل '),
      //   Tab(text: 'تم التوصيل '),
      //   Tab(text: 'مرتجع'),
      //   Tab(text: 'تم الاغاء'),
      // ],
    );
  }
}
