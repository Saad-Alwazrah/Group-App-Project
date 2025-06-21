import 'package:coffee_enjoyer/styles/app_colors.dart';
import 'package:coffee_enjoyer/styles/app_fonts.dart';
import 'package:flutter/material.dart';

class MainLabel extends StatelessWidget {
  final String labelText;
  const MainLabel({super.key, required this.labelText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(labelText, style: AppFonts.headline2),
      ),
    );
  }
}
