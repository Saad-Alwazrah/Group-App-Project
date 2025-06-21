import 'package:bloc/bloc.dart';
import 'package:group_app_project/screens/favourite/cubit/favourite_state.dart';
import 'package:group_app_project/widgets/home/main_card.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit() : super(const FavoriteState());

  void toggleFavorite(CoffeeItem item) {
    final isFav = state.favorites.any((CoffeeItem e) => e.name == item.name);
    if (isFav) {
      emit(state.copyWith(
        favorites: List.from(state.favorites)
          ..removeWhere((CoffeeItem e) => e.name == item.name),
      ));
    } else {
      emit(state.copyWith(
        favorites: List.from(state.favorites)..add(item),
      ));
    }
  }

  bool isFavorite(CoffeeItem item) {
    return state.favorites.any((CoffeeItem e) => e.name == item.name);
  }
}


