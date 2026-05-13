import 'package:depifinalproject/core/utils/assets.dart';
import 'package:depifinalproject/core/widgets/custom_cached_network_image.dart';
import 'package:depifinalproject/feature/orders/presentation/views/widgets/order_item_details_data.dart';
import 'package:depifinalproject/feature/orders/presentation/views/widgets/product_details_sec_data.dart';
import 'package:flutter/material.dart';

class CustomOrderOverAllDataDetails extends StatelessWidget {
  const CustomOrderOverAllDataDetails({
    super.key,
    required this.type,
    required this.name,
    required this.description,
    required this.image,
    required this.note,
    required this.imageVesrion,
  });
  final String type, name, description, image, note;
  final int imageVesrion;
  @override
  Widget build(BuildContext context) {
    return OrderItemDetailsSecData(
      title: 'بيانات الطرد',
      icon: Assets.imagesBoxIcon,
      children: [
        OrderItemDeatilsData(title: 'نوع الطرد', dataDetails: type),
        OrderItemDeatilsData(title: 'الاسم', dataDetails: name),
        OrderItemDeatilsData(title: 'الوصف', dataDetails: description),
        OrderItemDeatilsData(title: 'ملحوظه', dataDetails: note),
        SizedBox(height: 10),
        ClipRRect(
          borderRadius: BorderRadius.circular(8),

          child: CustomCachedNewtorkimage(
            imageUrl: image,
            imageVersion: imageVesrion,
            height: 150,
            width: double.infinity,
            fit: BoxFit.cover,
          ),

          // child: Image.network(
          //   image,
          //   height: 150,
          //   width: double.infinity,
          //   fit: BoxFit.cover,
          // ),
        ),
      ],
    );
  }
}
