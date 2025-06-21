import 'package:group_app_project/styles/app_colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String firstText;
  final String secondText;
  final Widget destination;
  const CustomText({
    super.key,
    required this.firstText,
    required this.secondText,
    required this.destination,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: "$firstText ",
        style: TextStyle(fontSize: 16, color: AppColors.systemBlack),
        children: [
          TextSpan(
            text: " $secondText",
            style: TextStyle(
              color: AppColors.primaryFilledColor,
              fontWeight: FontWeight.bold,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => destination),
                );
              },
          ),
        ],
      ),
    );
  }
}
