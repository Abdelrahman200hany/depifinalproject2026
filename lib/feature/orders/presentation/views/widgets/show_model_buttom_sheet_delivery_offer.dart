import 'package:depifinalproject/core/consts/consts.dart';
import 'package:depifinalproject/core/widgets/custom_text_bottom_with_background.dart';
import 'package:depifinalproject/core/widgets/custom_text_form_feild.dart';
import 'package:depifinalproject/core/widgets/top_head_model_sheet_line.dart';
import 'package:flutter/material.dart';

class ShowModelButtomSheetDelvieryOffer extends StatelessWidget {
  const ShowModelButtomSheetDelvieryOffer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: kHoriztailPadding),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TopHeadModelSheetLine(),
          SizedBox(height: 16),
          CustomTextFormFeild(
            textInputType: TextInputType.number,
            labelText: 'سعر التوصيل',
          ),
          SizedBox(height: 16),
          CustomTextBottomWithBackground(text: 'تقديم العرض'),
          SizedBox(height: 24),
        ],
      ),
    );
  }
}
