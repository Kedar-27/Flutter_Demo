import 'package:flutter/material.dart';
import '../pages/favorites_page.dart';
import '../pages/categories_page.dart';

class TabControllerPage extends StatefulWidget {
  @override
  _TabControllerPageState createState() => _TabControllerPageState();
}

class _TabControllerPageState extends State<TabControllerPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(title: Text('Meals'),
          bottom: TabBar(tabs: <Widget>[
              Tab(icon: Icon(Icons.category),text: 'Categories',),
             Tab(icon: Icon(Icons.star),text: 'Favorites',)
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            CategoriesPage(),
            FavoritesPage()
          ],
        ),


      )

      ,);
  }
}
