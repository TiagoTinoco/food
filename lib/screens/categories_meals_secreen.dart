import 'package:flutter/material.dart';
import 'package:food/models/meal.dart';

import '../models/category.dart';
import '../components/meal_item.dart';

class CategoriesMealsScren extends StatelessWidget {
  const CategoriesMealsScren({
    Key? key,
    required this.meals,
  }) : super(key: key);

  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)!.settings.arguments as Category;

    final categoryMeals = meals.where((meal) {
      return meal.categories.contains(category.id);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          category.title,
          style: const TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 26,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: categoryMeals.length,
        itemBuilder: (ctx, index) {
          return MealItem(meal: categoryMeals[index]);
        },
      ),
    );
  }
}
