import 'package:coffee_enjoyer/screens/authentication/register/register_screen.dart';
import 'package:coffee_enjoyer/styles/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: RegisterScreen(), theme: ThemeApp.lightMode);
  }
}
