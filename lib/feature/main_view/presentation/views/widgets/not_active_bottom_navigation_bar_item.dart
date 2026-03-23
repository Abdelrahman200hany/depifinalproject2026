import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

class NotActiveBottomNavigationBarItem extends StatelessWidget {
  const NotActiveBottomNavigationBarItem({
    super.key,
    required this.notActiveIcon,
  });

  final String notActiveIcon;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SvgPicture.asset(
        notActiveIcon,
        fit: BoxFit.scaleDown,
        height: 28,
        width: 28,
      ),
    );
  }
}
