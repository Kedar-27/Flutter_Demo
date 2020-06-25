import 'package:flutter/material.dart';

class CategoryMealsPage extends StatelessWidget {
  final String categoryId;
  final String categoryTitle;
  final Color categoryColor;

  const CategoryMealsPage({Key key, this.categoryId, this.categoryTitle, this.categoryColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.categoryTitle),
      ),
      body: Center(child:
        Text('Recipe'),
      ),
    );
  }
}
