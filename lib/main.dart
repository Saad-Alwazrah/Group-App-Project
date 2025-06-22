import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:june15th/repositories/api/supabase_connect.dart';
import 'package:june15th/screens/navbar/nav_bar.dart';
import 'package:june15th/styles/app_colors.dart';
import 'package:june15th/utilities/setup.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setup();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

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
      home: NavBar(),
    );
  }
}
