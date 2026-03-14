import 'package:depifinalproject/core/consts/consts.dart';
import 'package:depifinalproject/core/serviecs/shared_prefs_services/shared_prefs.dart';
import 'package:depifinalproject/core/widgets/custom_text_bottom.dart';
import 'package:depifinalproject/core/widgets/custom_text_bottom_with_background.dart';
import 'package:depifinalproject/feature/auth/presentation/views/sign_in_view.dart';
import 'package:depifinalproject/feature/on_boarding/data/model/page_view_item_model.dart';
import 'package:depifinalproject/feature/on_boarding/presentation/views/widgets/doits_list.dart';
import 'package:depifinalproject/feature/on_boarding/presentation/views/widgets/page_view.dart';

import 'package:flutter/material.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({super.key});

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  late final PageController controller;

  @override
  void initState() {
    super.initState();
    controller = PageController();
    controller.addListener(() {
      currentItemPageView = controller.page!.round();
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  List<PageViewItemModel> itemsList = PageViewItemModel.items;

  int currentItemPageView = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: kHoriztailPadding),
          child: Column(
            children: [
              Visibility(
                visible:currentItemPageView!=2 ,
                maintainSize: true,
                maintainState: true,
                maintainAnimation: true,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: CustomTextBottom(
                    text: 'تخط',
                    textColor: Colors.grey,
                    onPressed: () {
                      Navigator.pushNamed(context, SignInView.routeName);
                      Prefs.setBool(kOnBoadrdingViewSeen, true);
                    },
                  ),
                ),
              ),
              Expanded(
                child: CustomPageView(item: itemsList, controller: controller),
              ),

              DoitsList(currentPageIndecator: currentItemPageView),
              SizedBox(height: 20),
              CustomTextBottomWithBackground(
                text: currentItemPageView != 2 ? 'التالي' : 'ابدأ الآن',
                ontap: () {
                  if (currentItemPageView != 2) {
                    controller.animateToPage(
                      currentItemPageView + 1,
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeIn,
                    );
                  } else {
                    Navigator.pushNamed(context, SignInView.routeName);
                    Prefs.setBool(kOnBoadrdingViewSeen, true);
                  }
                },
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
