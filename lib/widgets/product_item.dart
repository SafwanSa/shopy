import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductItem extends StatelessWidget {
  ProductItem({this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: Image.network(''),
    );
  }
}
