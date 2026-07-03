import 'package:depifinalproject/feature/main_view/presentation/manager/main_view_cubit/main_view_cubit.dart';
import 'package:depifinalproject/feature/main_view/presentation/views/widgets/custom_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainViewBody extends StatefulWidget {
  const MainViewBody({super.key});

  @override
  State<MainViewBody> createState() => _MainViewBodyState();
}

class _MainViewBodyState extends State<MainViewBody> {
  // @override
  // void initState() {
  //   super.initState();
  //   final screens = context.watch<MainCubit>().loadScreens();
  // }

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
        children: context.read<MainCubit>().loadScreens(),
      ),
    );
  }
}
