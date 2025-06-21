import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:group_assignment/screens/favourite/cubit/favourite_cubit.dart';
import 'package:group_assignment/widgets/home/bottom_nav/cubit/bottom_nav_cubit.dart';
import 'package:group_assignment/widgets/home/bottom_nav/main_navigation_screen.dart';


void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => FavoriteCubit()),
        BlocProvider(create: (_) => BottomNavCubit()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainNavigationScreen(),
    );
  }
}


