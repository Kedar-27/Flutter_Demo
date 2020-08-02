import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/products_provider.dart';
import '../widget/product_grid.dart';

enum FilterOptions{
  Favorites,
  All
}

class ProductsOverviewPage extends StatefulWidget {
  
  
  
  @override
  _ProductsOverviewPageState createState() => _ProductsOverviewPageState();
}

class _ProductsOverviewPageState extends State<ProductsOverviewPage> {
  var _showFavoritesOnly = false;


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Shops App'),
        actions: <Widget>[
          PopupMenuButton(icon: Icon(Icons.more_vert),
              onSelected: (FilterOptions values){

                setState(() {

                  if (values == FilterOptions.Favorites){
                    this._showFavoritesOnly = true;
                  }else{
                    this._showFavoritesOnly = false;
                  }
                });

              },
              itemBuilder: (_) => [
                PopupMenuItem(child: Text('Only Favorites'),value: FilterOptions.Favorites,),
                PopupMenuItem(child: Text('Show All'),value: FilterOptions.All,),
              ]
          )
          ],
      ),
      body: ProductGrid(showOnlyFavoriteProducts: this._showFavoritesOnly,),
    );
  }
}


