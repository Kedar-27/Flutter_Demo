import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/products_provider.dart';
import '../model/product.dart';
import '../widget/product_item.dart';

class ProductGrid extends StatelessWidget {
    //region Properties
    final showOnlyFavoriteProducts;

  const ProductGrid({ this.showOnlyFavoriteProducts});



    //endregion

  @override
  Widget build(BuildContext context) {
    final productsObject = Provider.of<ProductsProvider>(context);
    final List<Product> products = this.showOnlyFavoriteProducts? productsObject.favProducts: productsObject.Products;


    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: products.length,
      itemBuilder: (ctx, i) {
        final product = products[i];
        return ChangeNotifierProvider.value(
          value: product,
          child: ProductItem(),
        );
      },
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
