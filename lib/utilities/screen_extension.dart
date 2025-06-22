import 'package:flutter/material.dart';

extension ScreenExtension on BuildContext {
  double get screenWidth => MediaQuery.of(this).size.width;

  double get screenHeight => MediaQuery.of(this).size.height;
  bool get isAndroid => Theme.of(this).platform == TargetPlatform.android;
  bool get isIOS => Theme.of(this).platform == TargetPlatform.iOS;
  double get keyboardPadding => MediaQuery.of(this).viewInsets.bottom;
}
