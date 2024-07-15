import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meal.dart';

class FavoriteMealsNotifier extends StateNotifier<List<Meal>> {
  FavoriteMealsNotifier() : super([]);

  bool toggleMealFavoriteStatus(Meal meal) {
    final isExisting = state.contains(meal);

    if (isExisting) {
      state = state.where((m) => m != meal).toList();
      return false;
      // state = List.from(state)..remove(meal);
    } else {
      state = [...state, meal];
      return true;
      // state = List.from(state)..add(meal);
    }
  }
}

final favoriteMealsProvider =
    StateNotifierProvider<FavoriteMealsNotifier, List<Meal>>((ref) {
  return FavoriteMealsNotifier();
});
