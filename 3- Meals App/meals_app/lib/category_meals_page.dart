import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';

class CategoryMealsPage extends StatelessWidget {
//  final String categoryId;
//  final String categoryTitle;
//  final Color categoryColor;
//
//  const CategoryMealsPage({Key key, this.categoryId, this.categoryTitle, this.categoryColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context).settings.arguments as Map<String,String>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(itemBuilder: (context,index){
        return Text('');

      },itemCount: DUMMY_MEALS.length,),
    );
  }
}
