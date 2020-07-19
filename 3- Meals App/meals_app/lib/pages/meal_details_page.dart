import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import '../dummy_data.dart';

class MealDetailsPage extends StatelessWidget {

  //region Properties
  final Function isFavorite;
  final Function toggleFavorite;

  const MealDetailsPage(this.toggleFavorite, this.isFavorite);

  //endregion

  //region Custom Widgets

  Widget buildSectionTitleWidget(BuildContext context, String title) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  Widget buildContainer(BuildContext context, Widget child) {
    final mediaQueryData = MediaQuery.of(context);
    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(5)),
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        width: mediaQueryData.size.width * 0.75,
        height: mediaQueryData.size.width * 0.55,
        child: child);
  }

  //endregion

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final mealId = routeArgs['id'];
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
        appBar: AppBar(title: Text('Meal Details')),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  height: mediaQueryData.size.height * 0.35,
                  width: mediaQueryData.size.width,
                  child: Image.network(
                    selectedMeal.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                this.buildSectionTitleWidget(context, 'Ingredients'),
                this.buildContainer(
                  context,
                  ListView.builder(
                    itemCount: selectedMeal.ingredients.length,
                    itemBuilder: (context, index) {
                      return Card(
                        margin: EdgeInsets.all(5),
                        color: Theme.of(context).accentColor,
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            selectedMeal.ingredients[index],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                this.buildSectionTitleWidget(context, 'Steps'),
                this.buildContainer(
                  context,
                  ListView.builder(
                    itemCount: selectedMeal.steps.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: <Widget>[
                          ListTile(
                            leading: CircleAvatar(
                              child: Text('# ${(index + 1)}'),
                            ),
                            title: Text(selectedMeal.steps[index]),
                          ),
                          Divider()
                        ],
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: this.isFavorite(mealId) ? Icon(Icons.star) : Icon(Icons.star_border),
          onPressed: (){
            this.toggleFavorite(mealId);
          }

              //() => Navigator.of(context).pop(mealId),
        ),
    );
  }
}
