import 'package:bloc/bloc.dart';
import 'package:meals/models/meal.dart';
import 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit() : super(const FavoritesState([]));

  void toggleMealFavoriteStatus(Meal meal) {
    final isExisting = state.favoriteMeals.contains(meal);

    if (isExisting) {
      final updatedMeals = state.favoriteMeals.where((m) => m != meal).toList();
      emit(FavoritesState(updatedMeals));
    } else {
      final updatedMeals = [...state.favoriteMeals, meal];
      emit(FavoritesState(updatedMeals));
    }
  }
}
