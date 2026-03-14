import 'package:depifinalproject/core/utils/app_style.dart';
import 'package:depifinalproject/feature/on_boarding/data/model/page_view_item_model.dart';
import 'package:flutter/material.dart';

class CustomPageViewItem extends StatelessWidget {
  const CustomPageViewItem({super.key, required this.item});
  final PageViewItemModel item;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 40),

        SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.4,
          width: double.infinity,
          child: Image.asset(item.image, fit: BoxFit.fill),
        ),
        SizedBox(height: 40),
        Text(
          item.title,
          style: AppStyle.styleBold23(context).copyWith(color: Colors.black),
        ),
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Text(
            item.subtitle,
            textAlign: TextAlign.center,
            style: AppStyle.styleSRegular16(
              context,
            ).copyWith(color: Colors.black),
          ),
        ),
      ],
    );
  }
}
