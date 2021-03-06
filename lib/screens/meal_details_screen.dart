import 'package:flutter/material.dart';

import '../widgets/meal_details.dart';

import '../dummy_data.dart';

class MealDetailsScreen extends StatelessWidget {
  static const routeName = '/meal-details';

  final Function toggleFavorite;
  final Function isFavorite;

  MealDetailsScreen(this.toggleFavorite, this.isFavorite);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final selectedMealTitle = routeArgs['title'];
    final selectedMealId = routeArgs['id'];
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) {
      return meal.id == selectedMealId;
    });
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMealTitle),
      ),
      body: MealDetails(
          id: selectedMeal.id,
          title: selectedMeal.title,
          imageUrl: selectedMeal.imageUrl,
          complexity: selectedMeal.complexity,
          affordability: selectedMeal.affordability,
          duration: selectedMeal.duration,
          ingredients: selectedMeal.ingredients,
          steps: selectedMeal.steps),
      floatingActionButton: 
          // FloatingActionButton(
          //   child: Icon(
          //     Icons.delete,
          //   ),
          //   onPressed: () {
          //     Navigator.of(context).pop(selectedMealId);
          //   },
          // ),
          FloatingActionButton(
            child: Icon(
              isFavorite(selectedMealId) ? Icons.favorite : Icons.favorite_border,
            ),
            onPressed: () {
              toggleFavorite(selectedMealId);
            },
          ),
    );
  }
}
