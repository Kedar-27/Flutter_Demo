import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shops_app/main.dart';
import '../model/product.dart';




class ProductItem extends StatelessWidget {
  //region Properties
//  final String id;
//  final String title;
//  final String imageUrl;
//
//  const ProductItem({this.id, this.title, this.imageUrl});

  //endregion

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);




    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
          onTap: (){
            Navigator.of(context).pushNamed(RouteNames.productDetails,arguments: product.id);
          } ,
        ),
        footer: GridTileBar(
          leading: IconButton(
              icon: product.isFavorite ? Icon(Icons.favorite) : Icon(Icons.favorite_border),
              onPressed: () {
                product.toggleFavoriteStatus();
              },
              color: Theme.of(context).accentColor),
          trailing: IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {},
            color: Theme.of(context).accentColor,
          ),
          title: Text(
            product.title,
            textAlign: TextAlign.center,
          ),
          backgroundColor: Colors.black87,
        ),
      ),
    );
  }
}
