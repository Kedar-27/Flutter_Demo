import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import '../widgets/meal_item.dart';
import '../dummy_data.dart';
import '../models/meal.dart';


class CategoryMealsPage extends StatefulWidget {
//  final String categoryId;
//  final String categoryTitle;
//  final Color categoryColor;
//
//  const CategoryMealsPage({Key key, this.categoryId, this.categoryTitle, this.categoryColor}) : super(key: key);

  final List<Meal> availableMeals;

  const CategoryMealsPage({this.availableMeals});



  @override
  _CategoryMealsPageState createState() => _CategoryMealsPageState();
}

class _CategoryMealsPageState extends State<CategoryMealsPage> {
  //region Properties
  String categoryTitle;
  List<Meal> displayedMeals;
  var _loadedInitially = false;


  //endregion
  
  
  
  
  
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    
    if (!this._loadedInitially) {
      final routeArgs =
      ModalRoute
          .of(context)
          .settings
          .arguments as Map<String, String>;
      this.categoryTitle = routeArgs['title'];
      final categoryId = routeArgs['id'];
      displayedMeals = widget.availableMeals
          .where((meal) => meal.categories.contains(categoryId))
          .toList();
      this._loadedInitially = true;
    }

    super.didChangeDependencies();
  }
  
  
  
  void _removeItem(String mealId){
    setState(() {
      displayedMeals.removeWhere((meal) => meal.id == mealId);
    });
  }
  
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemBuilder: (context, index) {
            final meal = displayedMeals[index];

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
                removeItem: this._removeItem,
              ),
            );
          },
          itemCount: displayedMeals.length,
        ),
      ),
    );
  }
}
