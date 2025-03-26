import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/meal_provider.dart';
import '../widgets/meal_card.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mealProvider = Provider.of<MealProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text("Search Meals")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              decoration: InputDecoration(
                labelText: "Search Meals",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                prefixIcon: const Icon(Icons.search),
              ),
              onSubmitted: (query) => mealProvider.fetchMeals(query),
            ),
          ),
          DropdownButton<String>(
            isExpanded: true,
            dropdownColor: Colors.transparent,
            value: mealProvider.selectedCategory,
            items: mealProvider.categories.map((category) {
              return DropdownMenuItem(value: category, child: Center(child: Text(category)),);
            }).toList(),
            onChanged: (category) {
              if (category != null) mealProvider.filterMealsByCategory(category);
            },
          ),
          Expanded(
            child: ListView.builder(
              itemCount: mealProvider.meals.length,
              itemBuilder: (context, index) {
                return MealCard(meal: mealProvider.meals[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
