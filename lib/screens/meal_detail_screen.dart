import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../services/meal_service.dart';

class MealDetailScreen extends StatefulWidget {
  final Meal meal;

  const MealDetailScreen({super.key, required this.meal});

  @override
  _MealDetailScreenState createState() => _MealDetailScreenState();
}

class _MealDetailScreenState extends State<MealDetailScreen> {
  Meal? fullMeal;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchFullMealDetails();
  }

  Future<void> _fetchFullMealDetails() async {
    final mealData = await MealService().getMealById(widget.meal.id);
    if (mealData != null) {
      setState(() {
        fullMeal = mealData;
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.meal.name)),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Meal Image
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(fullMeal!.image),
              ),
              const SizedBox(height: 10),

              // Meal Name
              Text(
                fullMeal!.name,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 10),

              // Category & Area
              Text(
                "Category: ${fullMeal!.category} ",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.grey),
              ),
              const SizedBox(height: 20),

              // Instructions
              Text(
                "Instructions",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 5),
              Text(
                fullMeal!.instructions,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
