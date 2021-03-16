import 'package:flutter/material.dart';
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
        ],
      ),
      body: ProductsGrid(
        showFavoriteOny: _showFavoriteOnly,
      ),
    );
  }
}
