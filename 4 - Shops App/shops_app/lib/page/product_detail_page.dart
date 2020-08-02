import 'package:flutter/material.dart';
import '../provider/products_provider.dart';
import 'package:provider/provider.dart';



class ProductDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context).settings.arguments as String;
    final loadedProduct = Provider.of<ProductsProvider>(context,listen: false).findProductById(productId);


    return Scaffold(
      appBar: AppBar(
        title: Text(loadedProduct.title),

      ),

    );
  }
}
