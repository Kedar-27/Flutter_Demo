import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';
import '../models/meal.dart';


class FavoritesPage extends StatefulWidget {
  //region Properties
  final List<Meal> favoriteMeals;

  const FavoritesPage({Key key, this.favoriteMeals}) : super(key: key);
  
  //endregion
  
  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    
    if(widget.favoriteMeals.isEmpty){
    return Center(
      child: Text('You don\'t have any favorites. Start adding some! '),
    );
  }else{
      return ListView.builder(
        itemBuilder: (context, index) {
          final meal = widget.favoriteMeals[index];

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
        itemCount: widget.favoriteMeals.length,
      );
    }
  }
}

