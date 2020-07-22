import 'package:flutter/material.dart';
import '../model/product.dart';
import '../widget/product_item.dart';

class ProductOverviewPage extends StatelessWidget {
  //region Properties
  List<Product> loadedProducts = [];

  //endregion

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Shop'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
        itemBuilder: (context, index) {
          final product = this.loadedProducts[index];
          return ProductItem(
            title: product.title,
            id: product.id,
            imageUrl: product.imageUrl,
          );
        },
        padding: const EdgeInsets.all(10.0),
        itemCount: this.loadedProducts.length,
      ),
    );
  }
}
