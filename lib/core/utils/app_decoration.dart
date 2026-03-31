import 'package:flutter/rendering.dart';

abstract class AppDecoration {
  static var greyBoxContainer = ShapeDecoration(
    color: const Color(0x7FF2F3F3),
    
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
  );
}
