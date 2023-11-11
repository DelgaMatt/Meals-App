import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meal.dart';

// State provider wants a 'Notifier' suffix on the new stateful object we are creating
class FavoriteMealsNotifier extends StateNotifier<List<Meal>> {
  // use an initializer list - we are using the Type above with the State notifier and passing that to the superclass
  // "should be a list of meals"
  // this value cannot/shouldnot ever be edited
  FavoriteMealsNotifier() : super([]);

// add any methods we might need to interact with the data
  bool toggleMealFavoriteStatus(Meal meal) {
    // not allowed to edit data existing in memory so we cant use ".add or .remove"
    final isFavorite = state.contains(meal);

    if (isFavorite) {
      // (m) is meal we're taking a look at vs meal in list
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    } else {
      // pull out & keep all existing meals in the list and add new meal to list
      state = [...state, meal];
      return true;
    }
  }
}

// this syntax good for dynamic data
final favoriteMealsProvider =
    StateNotifierProvider<FavoriteMealsNotifier, List<Meal>>((ref) {
  return FavoriteMealsNotifier();
});
