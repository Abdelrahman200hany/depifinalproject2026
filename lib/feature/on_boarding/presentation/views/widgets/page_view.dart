
import 'package:depifinalproject/feature/on_boarding/data/model/page_view_item_model.dart';
import 'package:depifinalproject/feature/on_boarding/presentation/views/widgets/page_view_item.dart';
import 'package:flutter/material.dart';

class CustomPageView extends StatelessWidget {
  const CustomPageView({super.key, required this.item, required this.controller});
  final List <PageViewItemModel> item;
  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller:controller ,
      itemCount: item.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: CustomPageViewItem(item:  item[index],),
      ),
    );
  }
}
