import 'package:depifinalproject/core/methods/show_snack_bar.dart';
import 'package:depifinalproject/core/widgets/custom_app_bar.dart';
import 'package:depifinalproject/feature/localtaion/presentation/views/wigets/language_item.dart';
import 'package:flutter/material.dart';

class LanguageViewBody extends StatelessWidget {
  const LanguageViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:CustomAppBar(title: 'اللغة' ,wantedIconBack: true,),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            LanguageItem(
              title: "اللغة العربية",
              flag: "🇪🇬",
              isSelected: true,
              onTap: () {
                // Change to Arabic
              },
            ),

            const SizedBox(height: 16),

            LanguageItem(

              title: "English",
              flag: "🇬🇧",
              isSelected: false,
              onTap: () {
                showfaulireSnackBar(context, message: 'قراءة اللغة الانجليزية غير متاحة حاليا');
              },
            ),
          ],
        ),
      ),
    );
  }
}
