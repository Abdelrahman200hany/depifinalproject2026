import 'package:depifinalproject/core/utils/assets.dart';

class PageViewItemModel {
  final String image ,title ,subtitle;

  PageViewItemModel({required this.image, required this.title, required this.subtitle});

  static List<PageViewItemModel> items = [
    PageViewItemModel(
      image: Assets.imagesOnBoardingOne,
      title: 'اشحن بسهولة',
      subtitle: 'اطلب شحن طردك في دقائق عبر خطواتبسيطة وسهلة للغاية',
    ),
    PageViewItemModel(
      image: Assets.imagesOnBoardingTwo,
      title: 'اختر أفضل عرض',
      subtitle:
          'استقبل عروض أسعار من مناديب قريبين منك وقارن بين التكلفة والتقييمات',
    ),
    PageViewItemModel(
      image: Assets.imagesOnBoardingThree,
      title: 'تتبع شحنتك لحظة بلحظة',
      subtitle: 'اعرف مكان الطرد وحالته في أي وقت من خلال نظام تتبع دقيق',
    ),
  ];
}