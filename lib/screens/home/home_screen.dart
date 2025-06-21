import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:group_assignment/screens/favourite/cubit/favourite_cubit.dart';
import 'package:group_assignment/screens/favourite/cubit/favourite_state.dart';
import 'package:group_assignment/widgets/home/category_filter.dart';
import 'package:group_assignment/widgets/home/main_card.dart';
import 'package:group_assignment/widgets/home/promo_banner.dart';

class CoffeeHomeScreen extends StatelessWidget {
  const CoffeeHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffedd6c8),

      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          children: [
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Location", style: TextStyle(fontSize: 12)),
                    const SizedBox(height: 2),
                    const Text(
                      "Bilzen, Tanjungbalai",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const Icon(Icons.tune, size: 28, color: Color(0xffc67c4e)),
              ],
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Search coffee",
                  icon: Icon(Icons.search),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const PromoBanner(),
            const SizedBox(height: 20),
            const CategoryFilter(),
            const SizedBox(height: 20),
            BlocBuilder<FavoriteCubit, FavoriteState>(
              builder: (context, state) {
                final items = [
                  CoffeeItem(
                    name: "Caffe Mocha",
                    subtitle: "Deep Foam",
                    price: "4.53",
                    imagePath: "lib/assets/images/Caffe_mocha.png",
                  ),
                  CoffeeItem(
                    name: "Flat White",
                    subtitle: "Espresso",
                    price: "3.53",
                    imagePath: "lib/assets/images/Flat_white.png",
                  ),
                  CoffeeItem(
                    name: "Latte",
                    subtitle: "Espresso",
                    price: "3.53",
                    imagePath: "lib/assets/images/latte.png",
                  ),
                ];

                return GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 16,
                  children: items.map((coffee) {
                    return CoffeeCard(
                      name: coffee.name,
                      subtitle: coffee.subtitle,
                      price: coffee.price,
                      imagePath: coffee.imagePath,
                      isFavorite: context.read<FavoriteCubit>().isFavorite(
                        coffee,
                      ),
                      onFavoriteToggle: () {
                        context.read<FavoriteCubit>().toggleFavorite(coffee);
                      },
                    );
                  }).toList(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
