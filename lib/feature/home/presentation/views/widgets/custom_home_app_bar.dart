import 'package:depifinalproject/core/utils/app_style.dart';
import 'package:depifinalproject/core/utils/assets.dart';
import 'package:depifinalproject/core/widgets/notication_icon_bottom.dart';
import 'package:flutter/material.dart';

class CustomHomeSliverAppBar extends StatelessWidget {
  const CustomHomeSliverAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.white,
      elevation: 0,

      // 🎨 الشكل
      surfaceTintColor: Colors.transparent,
      shadowColor: Colors.transparent,

      // 🧭 السلوك مع الاسكرول
      floating: true,
      snap: true,
      pinned: false,

      // 📏 الحجم
      toolbarHeight: kToolbarHeight,
      leading: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: CircleAvatar(
          radius: 10,
          backgroundImage: AssetImage(Assets.imagesMyphoto),
        ),
      ),

      centerTitle: false,
      titleSpacing: 0,

      title: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('صباح الخير !..', style: AppStyle.styleSRegular16(context)),
          const SizedBox(height: 2),
          Text(
            'عبدالرحمن هاني ',
            style: AppStyle.styleBold16(context).copyWith(color: Colors.black),
          ),
        ],
      ),

      actions: [
        Padding(
          padding: EdgeInsets.only(right: 10),
          child: NoticationIconBottom(onPressed: () {}),
        ),
      ],
    );
  }
}
