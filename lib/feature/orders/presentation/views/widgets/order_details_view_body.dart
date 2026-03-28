import 'package:flutter/material.dart';

class OrderDetailsViewBody extends StatelessWidget {
  const OrderDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'تفاصيل الطلب',
          style: TextStyle(fontFamily: 'Tajawal', color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        color: Colors.orange[50],
                        // لون قريب من "في انتظار العروض"
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        'في انتظار العروض',
                        style: TextStyle(color: Colors.orange),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'SH-2025-0012',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    const Text(
                      '12 أكتوبر 2025',
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'الرياض',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 5),
                    const Text('جدة'),
                  ],
                ),
              ),
              const ParcelDataWidget(),
              const FinancialDataWidget(),
              const ReceiveDataWidget(),
              const DeliveryDataWidget(),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20, vertical: 10),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[600],
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  child: const Text(
                      'تعديل الطلب', style: TextStyle(color: Colors.white)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20, vertical: 10),
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.red,
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  child: const Text('إلغاء الطلب'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ParcelDataWidget extends StatelessWidget {
  const ParcelDataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CardWidget(
      title: 'بيانات الطرد',
      iconPath: 'asstes/images/box_icon.png',
      children: [
        const RowItem(title: 'نوع الطرد', value: 'إلكترونيات'),
        const RowItem(title: 'الحجم', value: 'متوسط'),
        const RowItem(title: 'الوزن', value: '5.5 كجم'),
        const RowItem(title: 'الوصف', value: 'شاشة حاسوب محمولة مغلقة بعناية'),
        const SizedBox(height: 10),
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            'asstes/images/product_image.png',
            height: 150,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}

class FinancialDataWidget extends StatelessWidget {
  const FinancialDataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const CardWidget(
      title: 'البيانات المالية',
      iconPath: 'asstes/images/dollar_icon.png',
      children: [
        RowItem(title: 'مبلغ التحصيل', value: '250 ر.س'),
        RowItem(title: 'عربون', value: '50 ر.س'),
        RowItem(title: 'السعر المقترح', value: '45 ر.س'),
      ],
    );
  }
}

class ReceiveDataWidget extends StatelessWidget {
  const ReceiveDataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CardWidget(
      title: 'بيانات الاستلام',
      iconPath: 'asstes/images/location_icon.png',
      children: [
        const RowItem(title: 'الاسم', value: 'أحمد محمود'),
        const RowItem(title: 'رقم الجوال', value: '050XXXXX12'),
        const RowItem(
            title: 'العنوان',
            value: 'الرياض, حي الملقا, شارع الأمير محمد بن سعد'),
        const RowItem(
            title: 'التاريخ والوقت', value: '14 أكتوبر, 10:00 صباحاً'),
        const SizedBox(height: 10),
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            'asstes/images/map_1.png',
            height: 120,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}

class DeliveryDataWidget extends StatelessWidget {
  const DeliveryDataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CardWidget(
      title: 'بيانات التسليم',
      iconPath: 'asstes/images/true_icon.png',
      children: [
        const RowItem(title: 'المستلم', value: 'سارة العتيبي'),
        const RowItem(title: 'رقم الجوال', value: '055XXXXX89'),
        const RowItem(
            title: 'العنوان', value: 'جدة, حي الشاطئ, طريق الكورنيش'),
        const RowItem(title: 'تاريخ التوصيل المتوقع', value: '16 أكتوبر 2025'),
        const SizedBox(height: 10),
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            'asstes/images/map_2.png',
            height: 120,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}

class CardWidget extends StatelessWidget {
  final String title;
  final String iconPath;
  final List<Widget> children;

  const CardWidget({super.key,
    required this.title,
    required this.iconPath,
    required this.children});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 0.5,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(iconPath, width: 24, height: 24),
                const SizedBox(width: 10),
                Text(
                  title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.blueGrey),
                ),
              ],
            ),
            const Divider(height: 25),
            ...children,
          ],
        ),
      ),
    );
  }
}

class RowItem extends StatelessWidget {
  final String title;
  final String value;

  const RowItem({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style: const TextStyle(color: Color(0xff64748B), fontSize: 13)),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              value,
              textAlign: TextAlign.left,
              style: const TextStyle(color: Color(0xff1E293B),
                  fontWeight: FontWeight.w600,
                  fontSize: 13),
            ),
          ),
        ],
      ),
    );
  }
}