import 'package:flutter/material.dart';
import 'package:shopy/screens/product_detail_screen.dart';
import './screens/products_overview_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      },
    );
  }
}
