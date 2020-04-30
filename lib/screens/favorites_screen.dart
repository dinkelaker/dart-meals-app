import 'package:flutter/material.dart';

import '../models/meal.dart';

import '../widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;

  FavoritesScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    return favoriteMeals.isEmpty
        ? Center(child: Text('You have no favorites yet - start adding some!'))
        : ListView.builder(itemBuilder: (ctxt, index) {
            return MealItem(
                id: favoriteMeals[index].id,
                title: favoriteMeals[index].title,
                imageUrl: favoriteMeals[index].imageUrl,
                complexity: favoriteMeals[index].complexity,
                affordability: favoriteMeals[index].affordability,
                duration: favoriteMeals[index].duration,
                removeItem: () {});
          }, itemCount: favoriteMeals.length,);
  }
}
