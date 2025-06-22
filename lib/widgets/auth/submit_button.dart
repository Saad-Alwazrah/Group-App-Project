import 'package:flutter/material.dart';
import 'package:june15th/styles/app_colors.dart';
import 'package:june15th/utilities/extensions/screen_size.dart';

class SubmitButton extends StatelessWidget {
  final String buttonLabel;
  final bool isEnabled;
  final void Function()? pressedFunction;
  const SubmitButton({
    super.key,
    required this.buttonLabel,
    required this.pressedFunction,
    required this.isEnabled,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isEnabled ? pressedFunction : null,

      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.secondryColor,
        foregroundColor: AppColors.systemBlack,
        fixedSize: Size(context.getScreenWidth(size: 0.5), 48),
      ),
      child: Text(buttonLabel),
    );
  }
}
