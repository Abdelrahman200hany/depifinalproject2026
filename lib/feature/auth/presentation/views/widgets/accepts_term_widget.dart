import 'package:depifinalproject/core/widgets/custom_cheked_box.dart';
import 'package:depifinalproject/feature/auth/presentation/views/widgets/custom_asked_text_buttom.dart';
import 'package:flutter/material.dart';

class AcceptsTermWidget extends StatelessWidget {
  const AcceptsTermWidget({super.key, this.onTap, required this.onChange});
  final ValueChanged<bool> onChange;

  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomChekedBox(
          onChanged: (value) {
            onChange(value);
          },
        ),
        SizedBox(width: 8),
        Expanded(
          child: CustomAskedTextButtom(
            textAlign: TextAlign.start,
            fristText: 'بإنشاء الحساب، أنت توافق على ',
            secondText: 'الشروط والأحكام',
            onTap: onTap,
          ),
        ),
      ],
    );
  }
}
