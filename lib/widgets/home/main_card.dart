import 'package:flutter/material.dart';

class CoffeeItem {
  final String name;
  final String subtitle;
  final String price;
  final String imagePath;

  CoffeeItem({
    required this.name,
    required this.subtitle,
    required this.price,
    required this.imagePath,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CoffeeItem && runtimeType == other.runtimeType && name == other.name;

  @override
  int get hashCode => name.hashCode;
}




class CoffeeCard extends StatelessWidget {
  final String name;
  final String subtitle;
  final String price;
  final String imagePath;
  final bool isFavorite;
  final VoidCallback onFavoriteToggle;

  const CoffeeCard({
    super.key,
    required this.name,
    required this.subtitle,
    required this.price,
    required this.imagePath,
    required this.isFavorite,
    required this.onFavoriteToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Stack(
            children: [
              SizedBox(
                height: 120,
                child: Image.asset(imagePath, fit: BoxFit.cover),
              ),
              Positioned(
                right: 0,
                child: IconButton(
                  icon: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: isFavorite ? Colors.red : Colors.grey,
                  ),
                  onPressed: onFavoriteToggle,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(name,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          Text(subtitle,
              style: const TextStyle(color: Colors.grey, fontSize: 12)),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("\$$price",
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
              Container(
                padding: const EdgeInsets.all(6),
                decoration: const BoxDecoration(
                  color: Color(0xffc67c4e),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.add, color: Colors.white, size: 16),
              )
            ],
          )
        ],
      ),
    );
  }
}

