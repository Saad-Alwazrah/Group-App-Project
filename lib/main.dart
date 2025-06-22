import 'package:flutter/material.dart';
import 'package:june15th/screens/authentication/login/login_screen.dart';
import 'package:june15th/screens/navbar/nav_bar.dart';
import 'package:june15th/styles/app_colors.dart';
import 'package:june15th/utilities/setup.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Theme.of(context).copyWith(
        scaffoldBackgroundColor: AppColors.systemBackground,
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.primaryFilledColor,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: LoginScreen(),
    );
  }
}
