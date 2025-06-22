import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:june15th/screens/navbar/bloc/navbar_bloc.dart';
import 'package:june15th/styles/app_colors.dart';
import 'package:june15th/utilities/screen_extension.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavbarBloc(),
      child: BlocBuilder<NavbarBloc, NavbarState>(
        builder: (context, state) {
          var bloc = context.read<NavbarBloc>();
          return Scaffold(
            bottomNavigationBar: NavigationBar(
              backgroundColor: Colors.white,
              indicatorColor: Colors.transparent,

              destinations: [
                NavigationDestination(
                  selectedIcon: Image.asset(
                    "assets/images/housefill.png",
                    color: AppColors.primaryFilledColor,
                    width: context.screenWidth * 0.06,
                    height: context.screenWidth * 0.06,
                    fit: BoxFit.scaleDown,
                  ),
                  icon: Image.asset(
                    "assets/images/houseoutline.png",
                    color: Colors.grey,
                    width: context.screenWidth * 0.06,
                    height: context.screenWidth * 0.06,
                    fit: BoxFit.scaleDown,
                  ),
                  label: "Home",
                ),
                NavigationDestination(
                  selectedIcon: Image.asset(
                    "assets/images/favouritesfill.png",

                    color: AppColors.primaryFilledColor,
                    width: context.screenWidth * 0.06,
                    height: context.screenWidth * 0.06,
                    fit: BoxFit.scaleDown,
                  ),
                  icon: Image.asset(
                    "assets/images/favouritesoutline.png",
                    color: Colors.grey,
                    width: context.screenWidth * 0.06,
                    height: context.screenWidth * 0.06,
                    fit: BoxFit.scaleDown,
                  ),
                  label: "Favourites",
                ),
                NavigationDestination(
                  selectedIcon: Image.asset(
                    "assets/images/mapfill.png",
                    color: AppColors.primaryFilledColor,
                    width: context.screenWidth * 0.06,
                    height: context.screenWidth * 0.06,
                    fit: BoxFit.scaleDown,
                  ),
                  icon: Image.asset(
                    "assets/images/mapoutline.png",
                    color: Colors.grey,
                    width: context.screenWidth * 0.06,
                    height: context.screenWidth * 0.06,
                    fit: BoxFit.scaleDown,
                  ),
                  label: "Map",
                ),
                NavigationDestination(
                  selectedIcon: Image.asset(
                    "assets/images/wikifill.png",
                    color: AppColors.primaryFilledColor,
                    width: context.screenWidth * 0.06,
                    height: context.screenWidth * 0.06,
                    fit: BoxFit.scaleDown,
                  ),
                  icon: Image.asset(
                    "assets/images/wikioutline.png",
                    color: Colors.grey,
                    width: context.screenWidth * 0.06,
                    height: context.screenWidth * 0.06,
                    fit: BoxFit.scaleDown,
                  ),
                  label: "Wiki",
                ),

                NavigationDestination(
                  selectedIcon: Image.asset(
                    "assets/images/profilefill.png",
                    color: AppColors.primaryFilledColor,
                    width: context.screenWidth * 0.06,
                    height: context.screenWidth * 0.06,
                    fit: BoxFit.scaleDown,
                  ),
                  icon: Image.asset(
                    "assets/images/profileoutline.png",
                    color: Colors.grey,
                    width: context.screenWidth * 0.06,
                    height: context.screenWidth * 0.06,
                    fit: BoxFit.scaleDown,
                  ),
                  label: "Profile",
                ),
              ],
              selectedIndex: bloc.currentIndex,
              onDestinationSelected: (int index) {
                bloc.add(NavbarIndexChanged(index));
              },
            ),
            body: bloc.screens[bloc.currentIndex],
          );
        },
      ),
    );
  }
}
