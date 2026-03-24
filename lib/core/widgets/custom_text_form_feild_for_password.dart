import 'package:depifinalproject/core/widgets/custom_text_form_feild.dart';
import 'package:flutter/material.dart';

class CustomTextFormFieldForPasswoed extends StatefulWidget {
  const CustomTextFormFieldForPasswoed({
    super.key,
    this.onSaved,
    this.hint = 'كلمة المرور',
    this.labelText,
    this.validator,
    this.controller,
  });
  final String hint;
  final void Function(String?)? onSaved;
  final String? labelText;
  final String? Function(String?)? validator;
  final TextEditingController? controller;

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
      controller: widget.controller,
      validator: widget.validator,
      labelText: widget.labelText,
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
