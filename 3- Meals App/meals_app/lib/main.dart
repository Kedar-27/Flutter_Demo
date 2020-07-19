import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import './dummy_data.dart';
import './models/meal.dart';
import './pages/filter_page.dart';
import './pages/tabs_controller_page.dart';
import './pages/meal_details_page.dart';
import './pages/category_meals_page.dart';
import './pages/categories_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  //region Properties
  Map<String, bool> _filters = {
    'gluten': false,
    'vegan': false,
    'lactose': false,
    "vegetarian": false
  };

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];
  //endregion

  //region Methods

  void _setFilters(Map<String, bool> filterData) {
    this._filters = filterData;

    this._availableMeals = DUMMY_MEALS.where((meal) {
      if (this._filters['gluten'] && !meal.isGlutenFree) {
        return false;
      }
      if (this._filters['lactose'] && !meal.isLactoseFree) {
        return false;
      }
      if (this._filters['vegan'] && !meal.isVegan) {
        return false;
      }
      if (this._filters['vegetarian'] && !meal.isVegetarian) {
        return false;
      }

      return true;
    }).toList();
  }


  void _toggleFavourite(String mealId){
    final favoriteIndex = this._favoriteMeals.indexWhere((meal) => meal.id == mealId);
    if(favoriteIndex >= 0){
      setState((){
        this._favoriteMeals.removeWhere((meal) => meal.id == mealId);
      });

    }else{
      setState(() {
        this._favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });



    }

  }


  bool _isFavorite(String mealId){
    return this._favoriteMeals.any((meal) => meal.id == mealId);
  }




  //endregion


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meals App',
      theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
          primarySwatch: Colors.pink,
          accentColor: Colors.indigoAccent.shade200,
          canvasColor: Color.fromRGBO(255, 224, 229, 1),
          textTheme: ThemeData.light().textTheme.copyWith(
                bodyText1: TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1),
                ),
                bodyText2: TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1),
                ),
                headline6: TextStyle(
                  fontSize: 20,
                  fontFamily: 'RobotoCondensed',
                  fontWeight: FontWeight.bold,
                ),
              )),
      //home: CategoriesPage(),
      initialRoute: RouteNames.home,
      routes: {
        RouteNames.home: (context) => TabControllerPage(this._favoriteMeals),
        RouteNames.categoryMeals: (context) => CategoryMealsPage(
              availableMeals: this._availableMeals,
            ),
        RouteNames.mealDetails: (context) => MealDetailsPage(this._toggleFavourite,this._isFavorite),
        RouteNames.filter: (context) =>
            FilterPage(this._filters, this._setFilters),
      },
      onGenerateRoute: (settings) {
        print(settings.arguments);
        return MaterialPageRoute(builder: (context) {
          return CategoriesPage();
        });
      },
      onUnknownRoute: (settings) {
        print(settings.arguments);
        return MaterialPageRoute(builder: (context) {
          return CategoriesPage();
        });
      },
    );
  }
}

class RouteNames {
  static const String home = '/';
  static const String categoryMeals = '/category-meals';
  static const String mealDetails = '/meal-details';
  static const String filter = '/filter';
}
