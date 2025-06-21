import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:group_assignment/screens/favourite/favourite_screen.dart';
import 'package:group_assignment/screens/home/home_screen.dart';
import 'package:group_assignment/widgets/home/bottom_nav/bottom_nav.dart';
import 'package:group_assignment/widgets/home/bottom_nav/cubit/bottom_nav_cubit.dart';
import 'package:group_assignment/widgets/home/bottom_nav/cubit/bottom_nav_state.dart';



class MainNavigationScreen extends StatelessWidget {
  const MainNavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<BottomNavCubit, BottomNavState>(
        builder: (context, state) {
          switch (state.selectedIndex) {
            case 0:
              return const CoffeeHomeScreen();
            case 1:
              return const FavoriteScreen();
            case 2:
              return const Center(child: Text("Cart Page"));
            case 3:
              return const Center(child: Text("Profile Page"));
            default:
              return const CoffeeHomeScreen();
          }
        },
      ),
      bottomNavigationBar: const BottomNav(),
    );
  }
}
