import 'package:flutter/material.dart';



class ProductItem extends StatelessWidget {

  //region Properties
  final String id;
  final String title;
  final String imageUrl;

  const ProductItem({this.id, this.title, this.imageUrl});

  //endregion




  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: Image.network(imageUrl,fit: BoxFit.cover,),
      footer: GridTileBar(
        leading: IconButton(icon: Icon(Icons.favorite),onPressed: (){},),
        trailing: IconButton(icon: Icon(Icons.shopping_cart),onPressed: (){},),
        title: Text(this.title, textAlign: TextAlign.center,),
      backgroundColor: Colors.black54,),
    );
  }
}