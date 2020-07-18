import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './pages/filter_page.dart';
import './pages/tabs_controller_page.dart';
import './pages/meal_details_page.dart';
import './pages/category_meals_page.dart';
import './pages/categories_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meals App',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primarySwatch: Colors.pink,
        accentColor: Colors.indigoAccent,
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
        RouteNames.home : (context) => TabControllerPage(),

        RouteNames.categoryMeals : (context) => CategoryMealsPage(),

        RouteNames.mealDetails : (context) => MealDetailsPage(),
        RouteNames.filter : (context) => FilterPage(),
      },
      onGenerateRoute: (settings){
        print(settings.arguments);
        return MaterialPageRoute(builder: (context) {
          return CategoriesPage();
        });
      },
      onUnknownRoute: (settings){
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