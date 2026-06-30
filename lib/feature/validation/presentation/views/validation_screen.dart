import 'package:depifinalproject/feature/validation/presentation/views/widgets/custom_upload_validation_image_widget_bloc_provider.dart';
import 'package:flutter/material.dart';
import 'package:depifinalproject/core/utils/assets.dart';

class AccountValidationView extends StatefulWidget {
  const AccountValidationView({super.key});

  static const String routeName = 'AccountValidationView';

  @override
  State<AccountValidationView> createState() => _AccountValidationViewState();
}

class _AccountValidationViewState extends State<AccountValidationView> {
  final PageController controller = PageController();

  int currentIndex = 0;

  String? frontIdUrl;

  String? backIdUrl;

  String? selfieUrl;

  void nextPage() {
    controller.nextPage(
      duration: const Duration(milliseconds: 300),

      curve: Curves.easeIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("تأكيد الحساب")),

      body: PageView(
        controller: controller,

        physics: const NeverScrollableScrollPhysics(),

        onPageChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        },

        children: [
          ValidationStep(
            image: Assets.imagesBannerProfile,

            title: "صورة البطاقة الشخصية الأمامية",

            description:
                "ارفع صورة واضحة للوجه الأمامي من البطاقة "
                "وتأكد أن جميع البيانات ظاهرة.",

            uploadedImage: frontIdUrl,

            onUploaded: (url) {
              setState(() {
                frontIdUrl = url;
              });
            },
          ),

          ValidationStep(
            image: Assets.imagesBannerProfile,

            title: "صورة البطاقة الشخصية الخلفية",

            description:
                "ارفع صورة واضحة للوجه الخلفي من البطاقة "
                "مع ظهور البيانات كاملة.",

            uploadedImage: backIdUrl,

            onUploaded: (url) {
              setState(() {
                backIdUrl = url;
              });
            },
          ),

          ValidationStep(
            image: Assets.imagesBannerProfile,

            title: "صورة شخصية مع البطاقة",

            description:
                "التقط صورة واضحة وأنت تحمل البطاقة "
                "بحيث يظهر الوجه والبطاقة.",

            uploadedImage: selfieUrl,

            onUploaded: (url) {
              setState(() {
                selfieUrl = url;
              });
            },
          ),
        ],
      ),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),

        child: ElevatedButton(
          onPressed: () {
            if (currentIndex == 2) {
              print(frontIdUrl);

              print(backIdUrl);

              print(selfieUrl);

              // هنا تبعت الطلب
            } else {
              nextPage();
            }
          },

          child: Text(currentIndex == 2 ? "إرسال الطلب" : "التالي"),
        ),
      ),
    );
  }
}

class ValidationStep extends StatelessWidget {
  const ValidationStep({
    super.key,

    required this.image,

    required this.title,

    required this.description,

    required this.uploadedImage,

    required this.onUploaded,
  });

  final String image;

  final String title;

  final String description;

  final String? uploadedImage;

  final ValueChanged<String?> onUploaded;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          CustomUploadValidationImageWidget(
            placeholderImage: image,

            imageUrl: uploadedImage,

            onImageUploaded: onUploaded,
          ),

          const SizedBox(height: 30),

          Text(
            title,

            textAlign: TextAlign.center,

            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 15),

          Text(
            description,

            textAlign: TextAlign.center,

            style: const TextStyle(color: Colors.grey, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
