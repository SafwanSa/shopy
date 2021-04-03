import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopy/services/cart_service.dart';
import '../screens/product_detail_screen.dart';
import '../services/product.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);
    final cart = Provider.of<Cart>(context, listen: false);

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(
              ProductDetailScreen.routeName,
              arguments: {'productId': product.id},
            );
          },
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: IconButton(
            icon: Icon(
              product.isFavorite ? Icons.favorite : Icons.favorite_border,
            ),
            onPressed: () {
              product.toggleFavorite();
            },
            color: Theme.of(context).accentColor,
          ),
          trailing: IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              cart.addItem(
                id: product.id,
                title: product.title,
                price: product.price,
              );
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Item added to the cart.'),
                  duration: Duration(seconds: 2),
                  action: SnackBarAction(
                    label: 'Undo',
                    onPressed: () {
                      cart.remoteSingleItem(product.id);
                    },
                  ),
                ),
              );
            },
            color: Theme.of(context).accentColor,
          ),
          title: Text(
            product.title,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
