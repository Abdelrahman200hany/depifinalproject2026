import 'package:carousel_slider/carousel_slider.dart';
import 'package:depifinalproject/core/utils/assets.dart';
import 'package:flutter/material.dart';

class BannerCarsuselSlide extends StatefulWidget {
  const BannerCarsuselSlide({
    super.key,
    required this.carouselSliderController,
    required this.index,
  });

  final CarouselSliderController carouselSliderController;
  final ValueChanged<int> index;
  @override
  State<BannerCarsuselSlide> createState() => _BannerCarsuselSlideState();
}

class _BannerCarsuselSlideState extends State<BannerCarsuselSlide> {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      carouselController: widget.carouselSliderController,
      options: CarouselOptions(
        height: 120,
        viewportFraction: 0.8,
        initialPage: 0,
        enableInfiniteScroll: true,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 5),
        autoPlayAnimationDuration: Duration(milliseconds: 1000),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        enlargeFactor: 0.25,

        onPageChanged: (index, reason) {
          widget.index(index);
          setState(() {});
        },
      ),

      itemCount: imagelist.length,
      itemBuilder: (context, index, realIndex) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(
              image: AssetImage(imagelist[index]),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }

  List<String> imagelist = [
    Assets.imagesSliderIamgeOen,

    Assets.imagesSliderImageTwo,
    Assets.imagesSliderImageThree,
  ];
}
