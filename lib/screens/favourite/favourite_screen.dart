import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:group_app_project/screens/favourite/cubit/favourite_cubit.dart';
import 'package:group_app_project/screens/favourite/cubit/favourite_state.dart';
import 'package:group_app_project/widgets/home/main_card.dart'; // CoffeeCard

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffedd6c8),
      appBar: AppBar(
        title: const Text('Favorites'),
        backgroundColor: const Color(0xffc67c4e),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: BlocBuilder<FavoriteCubit, FavoriteState>(
        builder: (context, state) {
          final favoriteList = state.favorites;

          if (favoriteList.isEmpty) {
            return const Center(
              child: Text(
                'No favorites yet!',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: favoriteList.length,
            itemBuilder: (context, index) {
              final coffee = favoriteList[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: CoffeeCard(
                  name: coffee.name,
                  subtitle: coffee.subtitle,
                  price: coffee.price,
                  imagePath: coffee.imagePath,
                  isFavorite: true,
                  onFavoriteToggle: () {
                    context.read<FavoriteCubit>().toggleFavorite(coffee);
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}

