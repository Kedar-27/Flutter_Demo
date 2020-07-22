import 'package:flutter/material.dart';
import '../model/product.dart';
import '../widget/product_item.dart';

class ProductOverviewPage extends StatelessWidget {
  //region Properties
  List<Product> loadedProducts = [
    Product(
      id: 'p1',
      title: 'Red Shirt',
      description: 'A red shirt - it is pretty red!',
      price: 29.99,
      imageUrl:
          'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
    ),
    Product(
      id: 'p2',
      title: 'Trousers',
      description: 'A nice pair of trousers.',
      price: 59.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trous;

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
