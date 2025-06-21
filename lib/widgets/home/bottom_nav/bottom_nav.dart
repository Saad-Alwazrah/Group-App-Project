import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:group_app_project/widgets/home/bottom_nav/cubit/bottom_nav_cubit.dart';
import 'package:group_app_project/widgets/home/bottom_nav/cubit/bottom_nav_state.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavCubit, BottomNavState>(
  builder: (context, state) {
    return BottomNavigationBar(
      currentIndex: state.selectedIndex,
      onTap: (index) => context.read<BottomNavCubit>().changeTab(index),
      selectedItemColor: const Color(0xffc67c4e),
      unselectedItemColor: Colors.grey,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_filled),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_border),
          label: 'Favorites',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_bag_outlined),
          label: 'Cart',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          label: 'Profile',
        ),
      ],
    );
  },
);

  }
}
