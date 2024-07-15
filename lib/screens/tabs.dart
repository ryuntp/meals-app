import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/bloc/favorites/favorites_cubit.dart';
import 'package:meals/bloc/favorites/favorites_state.dart';
import 'package:meals/screens/categories.dart';
import 'package:meals/screens/filters.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/widgets/main_drawer.dart';
import 'package:meals/providers/filters_provider.dart';

const kInitialFilters = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegetarian: false,
  Filter.vegan: false,
};

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int _selectedPageIndex = 0;
  // Map<Filter, bool> _selectedFilters = {
  //   Filter.glutenFree: false,
  //   Filter.lactoseFree: false,
  //   Filter.vegetarian: false,
  //   Filter.vegan: false,
  // };

  // void _showInfoMessage(BuildContext context, String message) {
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     SnackBar(
  //       content: Text(message),
  //       duration: const Duration(seconds: 2),
  //     ),
  //   );
  // }

  // void _toggleMealFavouriteStatus(Meal meal) {
  //   final isExisting = _favouriteMeals.contains(meal);

  //   if (isExisting) {
  //     setState(() {
  //       _favouriteMeals.remove(meal);
  //       _showInfoMessage(context, 'Removed from favorites');
  //     });
  //   } else {
  //     setState(() {
  //       _favouriteMeals.add(meal);
  //       _showInfoMessage(context, 'Added to favorites');
  //     });
  //   }
  // }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _setScreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == 'filters') {
      await Navigator.of(context).push<Map<Filter, bool>>(
         // final result = await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(
          builder: (ctx) {
            return const FiltersScreen();
          },
        ),
      );
      // setState(() {
      //   _selectedFilters = result ?? kInitialFilters;
      // });
    }
  }

  @override
  Widget build(BuildContext context) {
    final availableMeals = ref.watch(filteredMealsProvider);

    Widget activePage = CategoriesScreen(
      availableMeals: availableMeals,
    );
    var activePageTitle = 'Categories';

    if (_selectedPageIndex == 1) {
      activePage = BlocBuilder<FavoritesCubit, FavoritesState>(
        builder: (context, state) {
          final favoriteMeals = state.favoriteMeals;
          return MealsScreen(
            meals: favoriteMeals,
          );
        },
      );
      activePageTitle = 'Favorites';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer: MainDrawer(
        onSelectScreen: _setScreen,
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
