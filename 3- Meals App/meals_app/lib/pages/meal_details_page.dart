import 'package:flutter/material.dart';


class MealDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context).settings.arguments as Map<String, String>;
    final mealId = routeArgs['id'];

    return Scaffold(
      appBar: AppBar(title: Text('Meal Details')),
      body: Container(child:
        Text('Meal details for $mealId'),),
    );
  }
}
