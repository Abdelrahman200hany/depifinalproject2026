import 'package:depifinalproject/core/consts/consts.dart';
import 'package:depifinalproject/core/widgets/custom_text_bottom_with_background.dart';
import 'package:depifinalproject/feature/home/presentation/views/add_order.dart';
import 'package:depifinalproject/feature/home/presentation/views/widgets/custom_home_app_bar.dart';
import 'package:depifinalproject/feature/home/presentation/views/widgets/sliver_stat_cart_list.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHoriztailPadding),
        child: CustomScrollView(
          slivers: [
            CustomHomeSliverAppBar(),
            SliverToBoxAdapter(child: const SizedBox(height: 18)),

            SliverstatCardList(),
            SliverToBoxAdapter(child: const SizedBox(height: 16)),

            SliverToBoxAdapter(
              child: CustomTextBottomWithBackground(
                text: 'انشاء طلب جديد',
                ontap: () {
                  Navigator.pushNamed(context, AddOrderView.routeName);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
