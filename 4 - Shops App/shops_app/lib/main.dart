import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './provider/products_provider.dart';
import './page/product_detail_page.dart';
import './page/products_overview_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProductsProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.deepOrange,
          fontFamily: 'Lato'
        ),
       // home: ProductsOverviewPage(),
        initialRoute: RouteNames.home,
        routes: {
          RouteNames.home: (context) => ProductsOverviewPage(),
          RouteNames.productDetails: (context) => ProductDetailPage(),
        },
//      onGenerateRoute: (settings) {
//        print(settings.arguments);
//        return MaterialPageRoute(builder: (context) {
//          return CategoriesPage();
//        });
//      },
//      onUnknownRoute: (settings) {
//        print(settings.arguments);
//        return MaterialPageRoute(builder: (context) {
//          return CategoriesPage();
//        });
//      },



      ),
    );
  }
}
class RouteNames {
  static const String home = '/';
  static const String productOverView = '/product-overview';
  static const String productDetails = '/product-details';
  //static const String filter = '/filter';
}


