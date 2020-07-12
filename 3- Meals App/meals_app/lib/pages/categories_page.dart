import 'package:flutter/material.dart';
import '../widgets/category_item.dart';
import '../dummy_data.dart';

class CategoriesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mediaQueryObject = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Meals App'),
        ),
        body: GridView(

          padding: const EdgeInsets.all(15),
          children: DUMMY_CATEGORIES.map((catData) {
            return CategoryItem(
              key: ValueKey(catData.id),
              id: catData.id,
              title: catData.title,
              color: catData.color,
            );
          }).toList(),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            childAspectRatio: 1.5,
            mainAxisSpacing: mediaQueryObject.size.width * 0.06,
            crossAxisSpacing: mediaQueryObject.size.width * 0.06,
            maxCrossAxisExtent: mediaQueryObject.size.width * 0.4,
          ),
        ),
      ),
    );
  }
}
