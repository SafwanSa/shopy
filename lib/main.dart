import 'package:flutter/material.dart';
import 'package:shopy/screens/cart_screen.dart';
import 'package:shopy/screens/orders_screen.dart';
import 'package:shopy/services/cart_service.dart';
import 'package:shopy/services/orders_service.dart';
import './screens/product_detail_screen.dart';
import './screens/products_overview_screen.dart';

import 'package:provider/provider.dart';
import 'services/product_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => Products(),
          ),
          ChangeNotifierProvider(
            create: (context) => Cart(),
          ),
          ChangeNotifierProvider(
            create: (context) => Orders(),
          )
        ],
        child: MaterialApp(
          title: 'Shopy',
          theme: ThemeData(
            primarySwatch: Colors.purple,
            accentColor: Colors.deepOrange,
            fontFamily: 'Lato',
          ),
          initialRoute: '/',
          routes: {
            '/': (_) => ProductsOverviewScreen(),
            ProductDetailScreen.routeName: (_) => ProductDetailScreen(),
            CartScreen.routeName: (_) => CartScreen(),
            OrdersScreen.routeName: (_) => OrdersScreen(),
          },
        ));
  }
}
