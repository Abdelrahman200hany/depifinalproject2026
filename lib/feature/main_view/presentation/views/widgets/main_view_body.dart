import 'package:depifinalproject/feature/home/presentation/views/home_view.dart';
import 'package:depifinalproject/feature/main_view/presentation/views/widgets/custom_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

class MainViewBody extends StatefulWidget {
  const MainViewBody({super.key});

  @override
  State<MainViewBody> createState() => _MainViewBodyState();
}

class _MainViewBodyState extends State<MainViewBody> {
  int currentSeletedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavigationBar(
        onItemSelected: (value) {
          currentSeletedIndex = value;
          setState(() {});
        },
      ),
      body: IndexedStack(
        index: currentSeletedIndex,
        children: [HomeView(), SizedBox(), SizedBox(), SizedBox()],
      ),
    );
  }
}
