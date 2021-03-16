import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopy/services/product_service.dart';

class ProductDetailScreen extends StatelessWidget {
  static String routeName = '/product-details';
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, Object>;
    final productId = routeArgs['productId'];
    final product =
        Provider.of<Products>(context, listen: false).findById(productId);

    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
      ),
      body: Container(
        child: Text('Welcome Fellow'),
      ),
    );
  }
}
