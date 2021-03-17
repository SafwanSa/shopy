import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopy/services/cart_service.dart';
import 'package:shopy/widgets/badge.dart';
import '../widgets/products_grid.dart';

enum FilterOptions {
  Favorite,
  All,
}

class ProductsOverviewScreen extends StatefulWidget {
  @override
  _ProductsOverviewScreenState createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  var _showFavoriteOnly = false;

  void _toggleShowFavoriteOnly(bool newState) {
    setState(() {
      _showFavoriteOnly = newState;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shopy"),
        actions: [
          PopupMenuButton(
            icon: Icon(Icons.more_vert),
            onSelected: (FilterOptions value) {
              if (value == FilterOptions.Favorite) {
                _toggleShowFavoriteOnly(true);
              } else {
                _toggleShowFavoriteOnly(false);
              }
            },
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text("Favorite"),
                value: FilterOptions.Favorite,
              ),
              PopupMenuItem(
                child: Text("All"),
                value: FilterOptions.All,
              )
            ],
          ),
          Consumer<Cart>(
            builder: (_, cart, child) => Badge(
              child: child,
              value: cart.itemsCount.toString(),
            ),
            child: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {},
            ),
          )
        ],
      ),
      body: ProductsGrid(
        showFavoriteOny: _showFavoriteOnly,
      ),
    );
  }
}
