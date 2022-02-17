import 'package:flutter/material.dart';
import 'package:food/data/dummy_data.dart';
import 'package:food/models/meal.dart';
import 'package:food/models/settings.dart';
import 'package:food/screens/meal_detail_screen.dart';
import 'package:food/screens/settings_screen.dart';
import 'package:food/screens/tabs_screen.dart';
import 'screens/categories_meals_secreen.dart';
import 'utils/app_routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Settings settings = Settings();
  List<Meal> availableMeals = dummyMeals;
  List<Meal> favoriteMeals = [];

  void filterMeals(Settings settings) {
    setState(() {
      this.settings = settings;

      availableMeals = dummyMeals.where((meal) {
        final fG = settings.isGlutenFree && !meal.isGlutenFree;
        final fL = settings.isLactoseFree && !meal.isLactoseFree;
        final fV = settings.isVegan && !meal.isVegan;
        final fVT = settings.isVegetarian && !meal.isVegetarian;

        return !fG && !fL && !fV && !fVT;
      }).toList();
    });
  }

  void _toggleFavorite(Meal meal) {
    setState(() {
      favoriteMeals.contains(meal)
          ? favoriteMeals.remove(meal)
          : favoriteMeals.add(meal);
    });
  }

  bool isFavorite(Meal meal) {
    return favoriteMeals.contains(meal);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vamos Cozinhar?',
      theme: ThemeData(
        fontFamily: 'Raleway',
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
        ),
        primaryColor: Colors.purple,
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: const TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
              ),
            ),
      ),
      routes: {
        AppRoutes.home: (ctx) => TabsScreen(favoriteMeals: favoriteMeals),
        AppRoutes.categoriesMeals: (ctx) =>
            CategoriesMealsScren(meals: availableMeals),
        AppRoutes.mealDetail: (ctx) => MealDetailScreen(
              onToggleFavorite: _toggleFavorite,
              isFavorite: isFavorite,
            ),
        AppRoutes.settings: (ctx) => SettingsScreen(
              onSettingsChanged: filterMeals,
              settings: settings,
            ),
      },
    );
  }
}
