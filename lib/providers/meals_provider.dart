import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/data/pseudo_data.dart';

// this syntax good for static data
final mealsProvider = Provider((ref) {
  return dummyMeals;
});
