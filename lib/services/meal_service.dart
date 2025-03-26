import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/meal.dart';

class MealService {
  static const String baseUrl = "https://www.themealdb.com/api/json/v1/1";

  static Future<List<Meal>> fetchMeals(String query) async {
    final response = await http.get(Uri.parse("$baseUrl/search.php?s=$query"));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data["meals"] == null) return [];
      return (data["meals"] as List).map((meal) => Meal.fromJson(meal)).toList();
    }
    return [];
  }

  static Future<List<String>> fetchCategories() async {
    final response = await http.get(Uri.parse("$baseUrl/categories.php"));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return (data["categories"] as List)
          .map((category) => category["strCategory"] as String)
          .toList();
    }
    return [];
  }

  static Future<List<Meal>> fetchMealsByCategory(String category) async {
    final response = await http.get(Uri.parse("$baseUrl/filter.php?c=$category"));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data["meals"] == null) return [];
      return (data["meals"] as List)
          .map((meal) => Meal.fromJson(meal))
          .toList();
    }
    return [];
  }
  // Fetch Meal by ID (Full Details)
  Future<Meal?> getMealById(String mealId) async {
    final response = await http.get(Uri.parse("$baseUrl/lookup.php?i=$mealId"));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data['meals'] != null) {
        return Meal.fromJson(data['meals'][0]);
      }
    }
    return null;
  }
}
