import 'package:depifinalproject/feature/home/presentation/views/widgets/stat_cart.dart';
import 'package:depifinalproject/feature/orders/presentation/manager/cubit/orders_report_cubit.dart';
import 'package:depifinalproject/feature/orders/presentation/manager/cubit/orders_report_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SliverstatCardListForClinet extends StatelessWidget {
  const SliverstatCardListForClinet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrdersReportCubit, OrdersReportState>(
      builder: (context, state) {
        if (state is OrdersReportLoading) {
          return const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 60),
              child: Center(child: CircularProgressIndicator()),
            ),
          );
        }

        if (state is OrdersReportFailure) {
          return SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 60),
              child: Center(
                child: Text(
                  state.message,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ),
          );
        }

        if (state is OrdersReportSuccess) {
          return SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
              childAspectRatio: .95,
            ),
            delegate: SliverChildListDelegate([
              /// إجمالي الطلبات
              StatCard(
                title: "إجمالي الطلبات",
                value: state.allOrders.toString(),
                subtitle: "عدد جميع الطلبات",
                color: Colors.indigo,
                icon: Icons.inventory_2_outlined,
              ),

              /// انتظار قبول الطلب
              StatCard(
                title: "في انتظار قبول الطلب",
                value: state.waitingAccept.toString(),
                subtitle: "بانتظار قبول المندوب",
                color: Colors.amber,
                icon: Icons.pending_actions,
              ),

              /// انتظار المندوب
              StatCard(
                title: "في انتظار المندوب",
                value: state.waitingDelivery.toString(),
                subtitle: "جاري البحث عن مندوب",
                color: Colors.deepOrange,
                icon: Icons.person_search_outlined,
              ),

              /// في الطريق
              StatCard(
                title: "في الطريق إلى العميل",
                value: state.onWay.toString(),
                subtitle: "طلبات يتم توصيلها حالياً",
                color: Colors.blue,
                icon: Icons.local_shipping_outlined,
              ),

              /// تم التوصيل
              StatCard(
                title: "تم التوصيل",
                value: state.delivered.toString(),
                subtitle: "طلبات مكتملة",
                color: Colors.green,
                icon: Icons.check_circle_outline,
              ),

              /// مرتجع
              StatCard(
                title: "طلبات مرتجعة",
                value: state.returned.toString(),
                subtitle: "تم إرجاع الطلب",
                color: Colors.red,
                icon: Icons.assignment_return_outlined,
              ),

              /// إجمالي تكلفة الشحن
              StatCard(
                title: "إجمالي الأرباح",
                value: state.parcelPrice.toStringAsFixed(0),
                subtitle: "من الطلبات المكتملة",
                color: Colors.teal,
                icon: Icons.account_balance_wallet_outlined,
              ),
            ]),
          );
        }

        return const SliverToBoxAdapter(child: SizedBox.shrink());
      },
    );
  }
}
