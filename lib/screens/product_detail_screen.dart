import 'package:flutter/material.dart';

class ProductDetailScreen extends StatelessWidget {
  static String routeName = '/product-details';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
      ),
      body: Container(
        child: Text('Welcome Fellow'),
      ),
    );
  }
}
