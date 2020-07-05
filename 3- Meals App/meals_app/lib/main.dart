import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/category_meals_page.dart';
import './categories_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meals App',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primarySwatch: Colors.pink,
        accentColor: Colors.amber, 
          canvasColor:  Color.fromRGBO(255, 224, 229, 1),
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
        )
      ),
      //home: CategoriesPage(),
      initialRoute: RouteNames.home,
      routes: {
        RouteNames.home : (context) => CategoriesPage(),

        RouteNames.categoryMeals : (context) => CategoryMealsPage(),

      },

      
      
    );
  }
}


class RouteNames {
  static const String home = '/';
  static const String categoryMeals = '/category-meals';
  //static const String slideshow = '/slideshow';
  //static const String settings = '/settings';
}