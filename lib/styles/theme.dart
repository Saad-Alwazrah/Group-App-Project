import 'package:coffee_enjoyer/styles/app_colors.dart';
import 'package:flutter/material.dart';

abstract class ThemeApp {
  static final lightMode = ThemeData(
    scaffoldBackgroundColor: AppColors.systemBackground,
  );
}
