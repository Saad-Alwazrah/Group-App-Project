import 'package:group_app_project/widgets/home/main_card.dart';

class FavoriteState {
  final List<CoffeeItem> favorites;

  const FavoriteState({this.favorites = const []});

  FavoriteState copyWith({List<CoffeeItem>? favorites}) {
    return FavoriteState(
      favorites: favorites ?? this.favorites,
    );
  }
}




