import 'package:depifinalproject/core/utils/app_style.dart';
import 'package:depifinalproject/core/widgets/notication_icon_bottom.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.wantedIconBack = false,
    this.wantedNotacationBottomIcon = false,
    this.wantedIconWithsectifLogic = false,
    this.spectificonlogic,
    this.spectifIcon,
  });
  final String title;
  final bool wantedIconBack;
  final bool wantedNotacationBottomIcon;
  final bool wantedIconWithsectifLogic;
  final IconData? spectifIcon;
  final void Function()? spectificonlogic;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: AppBar(
        backgroundColor: Colors.transparent,
        leading: wantedIconBack
            ? IconButton(
                icon: Icon(Icons.arrow_back_ios),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            : SizedBox(),
        title: Text(
          title,
          style: AppStyle.styleBold19(
            context,
          ).copyWith(color: const Color(0xFF0C0D0D)),
        ),
        centerTitle: true,
        forceMaterialTransparency: true,

        actions: [
          wantedNotacationBottomIcon
              ? NoticationIconBottom(
                  onPressed: () {
                    // Navigator.pushNamed(context, NotificationView.routeName);
                  },
                )
              : SizedBox(),
          wantedIconWithsectifLogic
              ? IconButton(onPressed: spectificonlogic, icon: Icon(spectifIcon))
              : SizedBox(),
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
