import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:june15th/screens/favourite/favourites_screen.dart';
import 'package:june15th/screens/home/home_screen.dart';
import 'package:june15th/screens/map/map_screen.dart';
import 'package:june15th/screens/profile/profile_screen.dart';
import 'package:june15th/screens/wiki/wiki_screen.dart';
import 'package:meta/meta.dart';

part 'navbar_event.dart';
part 'navbar_state.dart';

class NavbarBloc extends Bloc<NavbarEvent, NavbarState> {
  int currentIndex = 0;
  List<Widget> screens = [
    HomeScreen(),
    FavouritesScreen(),
    MapScreen(),
    WikiScreen(),
    ProfileScreen(),
  ];
  NavbarBloc() : super(NavbarInitial()) {
    on<NavbarEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<NavbarIndexChanged>((event, emit) {
      currentIndex = event.index;
      emit(NavbarIndexChangedState());
    });
  }
}
