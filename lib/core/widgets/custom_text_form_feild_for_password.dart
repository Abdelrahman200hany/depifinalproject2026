import 'package:depifinalproject/core/widgets/custom_text_form_feild.dart';
import 'package:flutter/material.dart';


class CustomTextFormFieldForPasswoed extends StatefulWidget {
  const CustomTextFormFieldForPasswoed({
    super.key,
    this.onSaved,
    this.hint = 'كلمة المرور',
  });
  final String hint;
  final void Function(String?)? onSaved;

  @override
  State<CustomTextFormFieldForPasswoed> createState() =>
      _CustomTextFormFieldForPasswoedState();
}

class _CustomTextFormFieldForPasswoedState
    extends State<CustomTextFormFieldForPasswoed> {
  bool isHidden = true;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormFeild(
      hint: widget.hint,
      textInputType: TextInputType.visiblePassword,
      isHidden: isHidden,
      onSaved: widget.onSaved,
      suffixIcon: IconButton(
        onPressed: () {
          isHidden = !isHidden;
          setState(() {});
        },
        icon: Icon(isHidden ? Icons.visibility : Icons.visibility_off),
      ),
    );
  }
}
