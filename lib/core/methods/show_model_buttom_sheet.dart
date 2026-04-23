import 'package:flutter/material.dart';

Future<dynamic> 
showCustomModelButtomSheet(
  BuildContext context, {
  required Widget child,
}) {
  return showModalBottomSheet(
    
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(12),
        topRight: Radius.circular(12),
      ),
    ),
    context: context,
    builder: (context) => child,
  );
}
