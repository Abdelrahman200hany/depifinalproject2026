import 'package:carousel_slider/carousel_controller.dart';
import 'package:depifinalproject/feature/home/presentation/views/widgets/bannerList.dart';
import 'package:depifinalproject/feature/home/presentation/views/widgets/doits_list.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class BannerCarsuselSliderLsit extends StatefulWidget {
  const BannerCarsuselSliderLsit({super.key});

  @override
  State<BannerCarsuselSliderLsit> createState() =>
      _BannerCarsuselSliderLsitState();
}

class _BannerCarsuselSliderLsitState extends State<BannerCarsuselSliderLsit> {
  final CarouselSliderController carouselSliderController =
      CarouselSliderController();

  int currentIndex = 0;
  bool enabled = true;
  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    await Future.delayed(const Duration(seconds: 4));

    setState(() {
      enabled = false;
    });
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: enabled,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          BannerCarsuselSlide(
            carouselSliderController: carouselSliderController,
            index: (int value) {
              currentIndex = value;
              setState(() {});
            },
          ),

          SizedBox(height: 10),
          DoitsList(isActive: currentIndex, itemsListcounter: 3),
        ],
      ),
    );
  }
}
