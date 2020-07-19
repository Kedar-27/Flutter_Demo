import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import '../widgets/main_drawer.dart';
import '../pages/favorites_page.dart';
import '../pages/categories_page.dart';

class TabControllerPage extends StatefulWidget {
  final List<Meal> favouriteMeals;

  const TabControllerPage(this.favouriteMeals);


  @override
  _TabControllerPageState createState() => _TabControllerPageState();
}

class _TabControllerPageState extends State<TabControllerPage> {
  List<Map<String, Object>> _pages;

  int _selectedPageIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    this._pages = [
      {'page': CategoriesPage(), 'title': 'Categories'},
      {'page': FavoritesPage(favoriteMeals: this.widget.favouriteMeals,), 'title': 'Your Favorites'}
    ];


    super.initState();
  }



  void _selectPage(int index) {
    setState(() {
      this._selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this._pages[this._selectedPageIndex]['title']),
      ),
      drawer: MainDrawer(),
      body: this._pages[this._selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: this._selectedPageIndex,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        backgroundColor: Theme.of(context).primaryColor,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text('Categories'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            title: Text('Favorites'),
          )
        ],
      ),
    );
  }
}
