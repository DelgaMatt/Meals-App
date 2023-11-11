import 'package:flutter_riverpod/flutter_riverpod.dart';

enum Filter { glutenFree, lactoseFree, vegetarian, vegan }

class FiltersNotifier extends StateNotifier<Map<Filter, bool>> {
  // angle brackets because we are expecting a Map of filters, not a list
  FiltersNotifier()
      : super({
          Filter.glutenFree: false,
          Filter.lactoseFree: false,
          Filter.vegetarian: false,
          Filter.vegan: false
        });

  void setFilter(Filter filter, bool isActive) {
    // state[filter] = isActive; // not allowed! => mutating state
    state = {...state, filter: isActive};
  }
}

final filtersProvider =
  StateNotifierProvider<FiltersNotifier, Map<Filter, bool>>((ref) {
    return FiltersNotifier();
});
