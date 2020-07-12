
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/main.dart';


class CategoryItem extends StatelessWidget {
  //region Properties
  final String id;
  final String title;
  final Color color;
  //endregion
  const CategoryItem({Key key,this.id,this.title, this.color}) : super(key: key);



  //region Methods
  void _selectCategory(BuildContext context){
//    Navigator.of(context).push( MaterialPageRoute(builder: (_){
//      return CategoryMealsPage(categoryColor: this.color,categoryId: this.id,categoryTitle: this.title,);
//    })
//    );
      Navigator.of(context).pushNamed(RouteNames.categoryMeals,arguments:
      {
        'id': this.id,
        'title': this.title,
      });
  }

  //endregion


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {this._selectCategory(context)},
      borderRadius: BorderRadius.circular(15),
      splashColor: Theme.of(context).primaryColor,
      child: Container(
        child: Text(this.title,
        style: Theme.of(context).textTheme.headline6,
        ),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [this.color.withOpacity(0.7), this.color],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight
           ),
            borderRadius: BorderRadius.circular(15),
        ),

      ),
    );
  }
}
