import 'dart:developer';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:june15th/repositories/models/cafe.dart';
import 'package:june15th/repositories/models/coffee.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseConnect {
  late Supabase supabase;
  User? user;
  List<Coffee> coffees = [];
  List<Cafe> cafes = [];
  List<Coffee> favorites = [];

  String getUserName() {
    return user?.email?.split('@').first ?? "Guest";
  }

  Future<void> init() async {
    try {
      supabase = await Supabase.initialize(
        url: dotenv.env['SUPABASE_URL']!,
        anonKey: dotenv.env['ANON_KEY']!,
      );
      await fetchData();
    } catch (e) {
      log("Supabase initialization failed: $e");
    }
  }

  Future<void> addFavourite() async {
    if (user == null) {
      log("User not signed in, cannot add favorite");
      return;
    }
    try {
      final resClient = supabase.client;
      for (var coffee in coffees) {
        if (!favorites.contains(coffee)) {
          await resClient.from('favorites').insert({
            'user_id': user!.id,
            'coffee_id': coffee.id,
          });
          favorites.add(coffee);
          log("Added ${coffee.title} to favorites");
        }
      }
    } catch (e) {
      log("Error adding favorite: $e");
    }
  }

  Future<void> removeFavourite(Coffee coffee) async {
    if (user == null) {
      log("User not signed in, cannot remove favorite");
      return;
    }
    try {
      final resClient = supabase.client;
      await resClient
          .from('favorites')
          .delete()
          .eq('user_id', user!.id)
          .eq('coffee_id', coffee.id);
      favorites.remove(coffee);
      log("Removed ${coffee.title} from favorites");
    } catch (e) {
      log("Error removing favorite: $e");
    }
  }

  Future<List<Coffee>> getFavorites() async {
    if (user == null) {
      log("User not signed in, cannot fetch favorites");
      return [];
    }
    try {
      final resClient = supabase.client;
      final favoritesRes = await resClient
          .from('favorites')
          .select('coffee_id')
          .eq('user_id', user!.id);
      if (favoritesRes.isNotEmpty) {
        final coffeeIds = favoritesRes.map((fav) => fav['coffee_id']).toList();
        for (var coffeeId in coffeeIds) {
          final favouriteCoffees = coffees
              .where((coffee) => coffee.id == coffeeId)
              .toList();
          if (favouriteCoffees.isNotEmpty) {
            favorites.addAll(favouriteCoffees);
          }
        }

        log("Fetched ${favorites.length} favorite coffees");
      } else {
        log("No favorites found for user");
      }
    } catch (e) {
      log("Error fetching favorites: $e");
    }
    return favorites;
  }

  Future fetchData() async {
    try {
      final resClient = supabase.client;
      final coffeesRes = await resClient.from('coffees').select('*');
      final cafesRes = await resClient.from('cafes').select('*');
      if (coffeesRes.isNotEmpty && cafesRes.isNotEmpty) {
        cafes = cafesRes.map((cafe) => Cafe.fromJson(cafe)).toList();
        for (var coffee in coffeesRes) {
          final coffeeObject = Coffee.fromJson(coffee);
          final whereToFind = await resClient
              .from('coffee_availability')
              .select('*')
              .eq('coffee_id', coffee['id']);
          for (var cafe in whereToFind) {
            final cafeData = await resClient
                .from('cafes')
                .select('*')
                .eq('id', cafe['cafe_id']);

            final relatedCafes = cafeData
                .map((cafe) => Cafe.fromJson(cafe))
                .toList();
            coffeeObject.cafes.addAll(relatedCafes);
          }
          coffees.add(coffeeObject);
          log(
            "${coffeeObject.title} can be found at ${coffeeObject.cafes.map((cafe) => cafe.name).join(', ')}",
          );
        }
        await getFavorites();
        log("Fetched ${coffees.length} coffees and ${cafes.length} cafes");
        log(cafes.map((cafe) => cafe.name).join(', '));
        log("The user has ${favorites.length} favorites");
      } else {
        log("No coffees or cafes found");
      }
    } catch (e) {
      log("Error fetching data: $e");
    }
  }

  Future<bool> signUpNewUser(String email, String password) async {
    final AuthResponse res = await supabase.client.auth.signUp(
      email: email,
      password: password,
    );
    final Session? session = res.session;
    final User? user = res.user;
    this.user = user;

    if (session != null) {
      log("User signed up as: ${user?.email}");
      return true;
    } else {
      log("Sign in failed");
      return false;
    }
  }

  Future<bool> signInWithUsername(String email, String password) async {
    final AuthResponse res = await supabase.client.auth.signInWithPassword(
      email: email,
      password: password,
    );
    final Session? session = res.session;
    final User? user = res.user;
    this.user = user;

    if (session != null) {
      log("User signed in: ${user?.email}");
      return true;
    } else {
      log("Sign in failed");
      return false;
    }
  }
}
