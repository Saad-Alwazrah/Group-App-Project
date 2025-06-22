import 'package:flutter/material.dart';
import 'package:june15th/styles/app_font.dart';

class ScreenLabel extends StatelessWidget {
  final String labelText;
  const ScreenLabel({super.key, required this.labelText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(labelText, style: AppFonts.headline1),
      ),
    );
  }
}
