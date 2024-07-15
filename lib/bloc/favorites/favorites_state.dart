import 'package:equatable/equatable.dart';
import 'package:meals/models/meal.dart';

class FavoritesState extends Equatable {
  final List<Meal> favoriteMeals;

  const FavoritesState(this.favoriteMeals);

  @override
  List<Object> get props => [favoriteMeals];
}
