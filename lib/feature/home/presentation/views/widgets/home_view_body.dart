import 'package:depifinalproject/core/consts/consts.dart';
import 'package:depifinalproject/core/methods/get_user_local_data.dart';
import 'package:depifinalproject/core/methods/show_dilog.dart';
import 'package:depifinalproject/core/serviecs/single_ton_services/create_single_ton.dart';
import 'package:depifinalproject/core/widgets/custom_text_bottom_with_background.dart';
import 'package:depifinalproject/feature/home/presentation/views/add_order.dart';
import 'package:depifinalproject/feature/home/presentation/views/widgets/banner_cursor_slider_list.dart';
import 'package:depifinalproject/feature/home/presentation/views/widgets/custom_home_app_bar.dart';
import 'package:depifinalproject/feature/home/presentation/views/widgets/sliver_stat_cart_list.dart';
import 'package:depifinalproject/feature/orders/presentation/manager/cubit/orders_report_cubit.dart';
import 'package:depifinalproject/feature/validation/presentation/views/valiation_condition_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
            SliverToBoxAdapter(child: BannerCarsuselSliderLsit()),
            SliverToBoxAdapter(child: const SizedBox(height: 18)),
            SliverToBoxAdapter(
              child: CustomTextBottomWithBackground(
                text: 'انشاء طلب جديد',
                ontap: () {
                  getUserData().isValided == true
                      ? Navigator.pushNamed(context, AddOrderView.routeName)
                      : showPop(
                          onConfirm: () {
                            Navigator.pushNamed(
                              context,
                              ValidationConditionView.routeName,
                            );
                          },
                          onConfermText: 'الذهاب الي صفحه التوثيق',
                          title: 'تنبيه',
                          content: 'يجب عليك توثيق حسابك اولا',
                          context: context,
                        );
                },
              ),
            ),
            SliverToBoxAdapter(child: const SizedBox(height: 16)),

            BlocProvider(
              create: (_) => getIt<OrdersReportCubit>()..getOrdersReport(),
              child: const SliverstatCardListForClinet(),
            ),

            SliverToBoxAdapter(child: const SizedBox(height: 16)),
          ],
        ),
      ),
    );
  }
}
