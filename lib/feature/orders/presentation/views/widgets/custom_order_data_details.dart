
import 'package:depifinalproject/core/utils/assets.dart';
import 'package:depifinalproject/feature/orders/presentation/views/widgets/order_item_details_data.dart';
import 'package:depifinalproject/feature/orders/presentation/views/widgets/product_details_sec_data.dart';
import 'package:flutter/material.dart';

class CustomOrderOverAllDataDetails extends StatelessWidget {
  const CustomOrderOverAllDataDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return OrderItemDetailsSecData(
      title: 'بيانات الطرد',
      icon: Assets.imagesBoxIcon,
      children: [
        const OrderItemDeatilsData(
          title: 'نوع الطرد',
          dataDetails: 'إلكترونيات',
        ),
        const OrderItemDeatilsData(title: 'الحجم', dataDetails: 'متوسط'),
        const OrderItemDeatilsData(
          title: 'الوصف',
          dataDetails:
              'شاشة حاسوب محمولة مغلقة بعنايةة مغلقة بعنايةة مغلقة بعناية',
        ),
        const OrderItemDeatilsData(
          title: 'ملحوظه',
          dataDetails:
              'شاشة حاسوب محمولة مغلقة بعنايةة مغلقة بعنايةة مغلقة بعناية',
        ),
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


