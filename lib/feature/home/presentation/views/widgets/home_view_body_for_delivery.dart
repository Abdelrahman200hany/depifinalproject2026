import 'package:depifinalproject/core/consts/consts.dart';
import 'package:depifinalproject/core/methods/get_user_local_data.dart';
import 'package:depifinalproject/core/serviecs/single_ton_services/create_single_ton.dart';
import 'package:depifinalproject/feature/home/presentation/views/widgets/banner_cursor_slider_list.dart';
import 'package:depifinalproject/feature/home/presentation/views/widgets/custom_home_app_bar.dart';
import 'package:depifinalproject/feature/home/presentation/views/widgets/sliver_stat_cart_list_for_delivery.dart';
import 'package:depifinalproject/feature/profile/pepesentation/manager/get_ratess_tatistics/get_rates_statistics_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewBodyForDelivery extends StatelessWidget {
  const HomeViewBodyForDelivery({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHoriztailPadding),
        child: CustomScrollView(
          slivers: [
            CustomHomeSliverAppBar(),
            SliverToBoxAdapter(child: const SizedBox(height: 18)),
            SliverToBoxAdapter(child: BannerCarsuselSliderLsit()),
            SliverToBoxAdapter(child: const SizedBox(height: 18)),
            BlocProvider(
              create: (_) =>
                  getIt<GetRatesStatisticsCubit>()
                    ..getRatesStatistics(targetUserId: getUserData().userID!),
              child: const SliverStatCardListForDelivery(),
            ),

            SliverToBoxAdapter(child: const SizedBox(height: 16)),
          ],
        ),
      ),
    );
  }
}
