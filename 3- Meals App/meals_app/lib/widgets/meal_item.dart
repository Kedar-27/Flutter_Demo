import 'package:flutter/material.dart';
import '../main.dart';
import '../models/meal.dart';

class MealItem extends StatelessWidget {
  //region Properties
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Affordability affordability;
  final Complexity complexity;
  final Function removeItem;

  const MealItem(
      {Key key,
      @required this.title,
      @required this.imageUrl,
      @required this.duration,
      @required this.complexity,
      @required this.affordability,
      @required this.id,
        this.removeItem})
      : super(key: key);

  //endregion

  String get complexityText {
    switch (this.complexity) {
      case Complexity.Simple:
        return 'Simple';
        break;
      case Complexity.Hard:
        return 'Hard';
        break;

      case Complexity.Challenging:
        return 'Challenging';
        break;
    }
  }

  String get affordabiltyText {
    switch (this.affordability) {
      case Affordability.Affordable:
        // TODO: Handle this case.
        return 'Affordable';
      case Affordability.Pricey:
        // TODO: Handle this case.
        return 'Pricey';
      case Affordability.Luxurious:
        // TODO: Handle this case.
        return 'Luxurious';
    }
  }

  //region Methods
  void selectMeal(BuildContext context) {
    Navigator.of(context).pushNamed(RouteNames.mealDetails, arguments: {
      'id': this.id,
      'title': this.title,
    }).then((result) {
      if(result != null){
        this.removeItem(result);
      }

    });
  }

  //endregion

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return InkWell(
        onTap: () => this.selectMeal(context),
        child: Card(
            elevation: 4,
            margin: EdgeInsets.all(10),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    ClipRRect(
                      child: Image.network(
                        this.imageUrl,
                        height: constraints.maxHeight * 0.75,
                        width: constraints.maxWidth,
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                    ),
                    Positioned(
                      bottom: 20,
                      left: 10,
                      child: Container(
                          color: Colors.black54,
                          padding:
                              EdgeInsets.symmetric(horizontal: 5, vertical: 20),
                          width: 300,
                          child: Text(
                            title,
                            style: TextStyle(fontSize: 26, color: Colors.white),
                            softWrap: true,
                            overflow: TextOverflow.fade,
                          )),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Icon(Icons.schedule),
                          SizedBox(width: 6),
                          Text('$duration min'),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Icon(Icons.work),
                          SizedBox(width: 6),
                          Text(this.complexityText),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Icon(Icons.attach_money),
                          SizedBox(width: 6),
                          Text(this.affordabiltyText),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            )),
      );
    });
  }
}
