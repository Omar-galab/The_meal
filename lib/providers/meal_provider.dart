import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../services/meal_service.dart';

class MealProvider extends ChangeNotifier {
  List<Meal> _meals = [];
  List<String> _categories = [];
  String _selectedCategory = "All";

  List<Meal> get meals => _meals;
  List<String> get categories => _categories;
  String get selectedCategory => _selectedCategory;

  MealProvider() {
    fetchCategories();
    fetchMeals();
  }

  Future<void> fetchMeals([String query = ""]) async {
    _meals = await MealService.fetchMeals(query);
    notifyListeners();
  }

  Future<void> fetchCategories() async {
    _categories = await MealService.fetchCategories();
    _categories.insert(0, "All");
    notifyListeners();
  }

  Future<void> filterMealsByCategory(String category) async {
    _selectedCategory = category;
    if (category == "All") {
      fetchMeals();
    } else {
      _meals = await MealService.fetchMealsByCategory(category);
      notifyListeners();
    }
  }
}
