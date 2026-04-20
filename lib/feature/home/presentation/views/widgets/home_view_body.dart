import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFF),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage("asstes/images/zewaidi_icon.jpg"),
                ),
                const SizedBox(width: 90),
                const Text(
                  "مرحباً، أحمد",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
              ],
            ),
            IconButton(
              icon: const Icon(
                  Icons.notifications_none, color: Colors.black, size: 28),
              onPressed: () {},
            ),
          ],
        ),
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                childAspectRatio: 1.1,
                children: const [
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
                ],
              ),
              const SizedBox(height: 25),
              SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.add_circle_outline, size: 28),
                  label: const Text(
                    "إنشاء طلب شحن جديد",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2D6CE1),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 5,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "آخر الشحنات",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                        "عرض الكل", style: TextStyle(fontSize: 16)),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const ShipmentTile(
                title: "إلكترونيات",
                route: "الرياض ← جدة",
                date: "12 Oct",
                price: "150 ر.س",
                status: "قيد التنفيذ",
                statusColor: Colors.blue,
              ),
              const ShipmentTile(
                title: "ملابس",
                route: "الدمام ← مكة",
                date: "14 Oct",
                price: "45 ر.س",
                status: "بانتظار",
                statusColor: Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class StatCard extends StatelessWidget {
  final String title, value, subtitle;
  final Color color;
  final IconData icon;

  const StatCard({
    super.key,
    required this.title,
    required this.value,
    required this.subtitle,
    required this.color,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 5),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: color, size: 24),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: const TextStyle(fontSize: 12, color: Colors.grey)),
              const SizedBox(height: 4),
              Text(value, style: const TextStyle(
                  fontSize: 22, fontWeight: FontWeight.bold)),
              Text(subtitle, style: TextStyle(
                  fontSize: 10, color: color, fontWeight: FontWeight.w500)),
            ],
          ),
        ],
      ),
    );
  }
}

class ShipmentTile extends StatelessWidget {
  final String title, route, date, price, status;
  final Color statusColor;

  const ShipmentTile({
    super.key,
    required this.title,
    required this.route,
    required this.date,
    required this.price,
    required this.status,
    required this.statusColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.inventory_2, color: Colors.grey),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 16)),
                const SizedBox(height: 4),
                Text("$route • $date",
                    style: const TextStyle(color: Colors.grey, fontSize: 12)),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: statusColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  status,
                  style: TextStyle(color: statusColor,
                      fontSize: 11,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 8),
              Text(price, style: const TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 14)),
            ],
          ),
        ],
      ),
    );
  }
}