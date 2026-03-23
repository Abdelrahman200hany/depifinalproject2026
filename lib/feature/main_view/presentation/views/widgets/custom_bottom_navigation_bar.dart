import 'package:depifinalproject/feature/main_view/data/models/bottom_navigation_bar_model.dart';
import 'package:depifinalproject/feature/main_view/presentation/views/widgets/bottom_navigation_bar_item.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key, required this.onItemSelected});
  final ValueChanged<int> onItemSelected;
  // final int selectedIndex;
  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  List<BottomNavigationBarItemModel> items =
      BottomNavigationBarItemModel.bottomNavigationBarItems;
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 375,
      height: 70,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        shadows: [
          BoxShadow(
            color: Color(0x19000000),
            blurRadius: 25,
            offset: Offset(0, -2),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Row(
        children: items.asMap().entries.map((e) {
          int index = e.key;
          var item = e.value;

          return Expanded(
            flex: selectedIndex == index ? 3: 2,
            child: GestureDetector(
              onTap: () {
                selectedIndex = index;
                widget.onItemSelected(index);

                setState(() {});
              },
              child: CustomBottomNavigationBarItem(
                isActive: selectedIndex == index,
                item: item,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
