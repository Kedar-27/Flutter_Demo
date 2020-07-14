import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';
import '../dummy_data.dart';

class CategoryMealsPage extends StatelessWidget {
//  final String categoryId;
//  final String categoryTitle;
//  final Color categoryColor;
//
//  const CategoryMealsPage({Key key, this.categoryId, this.categoryTitle, this.categoryColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    final categoryMeals = DUMMY_MEALS
        .where((meal) => meal.categories.contains(categoryId))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemBuilder: (context, index) {
            final meal = categoryMeals[index];

            return Container(
              height: MediaQuery.of(context).size.width * 0.8,
              child: MealItem(
                key: ValueKey(meal.id),
                id: meal.id,
                complexity: meal.complexity,
                imageUrl: meal.imageUrl,
                title: meal.title,
                duration: meal.duration,
                affordability: meal.affordability,
              ),
            );
          },
          itemCount: categoryMeals.length,
        ),
      ),
    );
  }
}
