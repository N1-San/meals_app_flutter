import 'package:flutter/material.dart';

import 'package:meals_app_flutter/models/meal.dart';
import 'package:meals_app_flutter/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({
    super.key, 
    required this.title, 
    required this.meals
  });  

  final String title;
  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    Widget content = Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'nothing here',
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
              color: Theme.of(context).colorScheme.onSurface
            ),
          ),
          const SizedBox(height: 16,),
          Text (
            'try selecting a different category',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: Theme.of(context).colorScheme.onSurface
            ),
          ),
        ],
      ),
    );
    
    if (meals.isNotEmpty) {
      content = ListView.builder(
        itemCount: meals.length,
        itemBuilder: (ctx, index) => MealItem(meal: meals[index]),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Available Meals'),
      ),
      body: content,
    );
  }
}