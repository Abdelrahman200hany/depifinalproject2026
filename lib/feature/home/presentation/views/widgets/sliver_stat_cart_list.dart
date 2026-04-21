import 'package:depifinalproject/feature/home/presentation/views/widgets/stat_cart.dart';
import 'package:flutter/material.dart';

class SliverstatCardList extends StatelessWidget {
  const SliverstatCardList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
        childAspectRatio: 1.1,
      ),
    
      delegate: SliverChildListDelegate([
        StatCard(
          title: "طلبات قيد التنفيذ",
          value: "4",
          subtitle: "طلبات يتم توصيلها حالياً",
          color: Colors.blue,
          icon: Icons.local_shipping_outlined,
        ),
        StatCard(
          title: "طلبات تم توصيلها",
          value: "12",
          subtitle: "إجمالي الطلبات المكتملة",
          color: Colors.green,
          icon: Icons.check_circle_outline,
        ),
        StatCard(
          title: "إجمالي المدفوعات",
          value: "1,250",
          subtitle: "ر.س تكلفة الشحن",
          color: Colors.orange,
          icon: Icons.account_balance_wallet_outlined,
        ),
        StatCard(
          title: "طلبات ملغاة",
          value: "1",
          subtitle: "تم إلغاؤها",
          color: Colors.red,
          icon: Icons.cancel_outlined,
        ),
      ]),
    );
  }
}
