import 'package:depifinalproject/feature/home/presentation/views/widgets/stat_cart.dart';
import 'package:depifinalproject/feature/profile/pepesentation/manager/get_ratess_tatistics/get_rates_statistics_cubit.dart';
import 'package:depifinalproject/feature/profile/pepesentation/manager/get_ratess_tatistics/get_rates_statistics_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SliverStatCardListForDelivery extends StatelessWidget {
  const SliverStatCardListForDelivery({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetRatesStatisticsCubit, GetRatesStatisticsState>(
      builder: (context, state) {
        if (state is GetRatesStatisticsLoading) {
          return const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 60),
              child: Center(child: CircularProgressIndicator()),
            ),
          );
        }

        if (state is GetRatesStatisticsFailure) {
          return SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 60),
              child: Center(
                child: Text(state.message, style: TextStyle(fontSize: 16)),
              ),
            ),
          );
        }

        if (state is GetRatesStatisticsSuccess) {
          return SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
              childAspectRatio: .95,
            ),
            delegate: SliverChildListDelegate([
              /// متوسط التقييم
              StatCard(
                title: "متوسط التقييم",
                value: state.averageRate.toStringAsFixed(1),
                subtitle: "من 5 نجوم",
                color: Colors.amber,
                icon: Icons.star_rounded,
              ),

              /// عدد التقييمات
              StatCard(
                title: "عدد التقييمات",
                value: state.ratesCount.toString(),
                subtitle: "إجمالي تقييمات العملاء",
                color: Colors.indigo,
                icon: Icons.reviews_outlined,
              ),

              /// نسبة الرضا
              StatCard(
                title: "رضا العملاء",
                value: "${state.satisfactionRate.toStringAsFixed(0)}%",
                subtitle: "بناءً على جميع التقييمات",
                color: Colors.green,
                icon: Icons.sentiment_very_satisfied_outlined,
              ),

              /// تقييمات 5 نجوم
              StatCard(
                title: "تقييمات 5 نجوم",
                value: state.fiveStars.toString(),
                subtitle: "عدد العملاء الراضين جدًا",
                color: Colors.orange,
                icon: Icons.workspace_premium_outlined,
              ),
            ]),
          );
        }

        return const SliverToBoxAdapter(child: SizedBox.shrink());
      },
    );
  }
}
