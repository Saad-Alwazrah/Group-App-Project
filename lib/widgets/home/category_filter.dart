import 'package:flutter/material.dart';

class CategoryFilter extends StatelessWidget {
  final List<String> categories = const [
    'All Coffee',
    'Macchiato',
    'Latte',
    'Americano',
  ];

  const CategoryFilter({super.key});

  @override
  Widget build(BuildContext context) {
    // Example: Replace with context.watch<CategoryCubit>().state later
    final String selectedCategory = 'All Coffee'; // static for now

    return SizedBox(
      height: 40,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final String category = categories[index];
          final bool isSelected = category == selectedCategory;

          return GestureDetector(
            onTap: () {
              // To be connected to Cubit:
              // context.read<CategoryCubit>().selectCategory(category);
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
              decoration: BoxDecoration(
                color: isSelected ? const Color(0xffc67c4e) : Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                category,
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
