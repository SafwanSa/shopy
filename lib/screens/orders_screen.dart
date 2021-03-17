import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopy/services/orders_service.dart';
import 'package:shopy/widgets/main_drawer.dart';
import 'package:shopy/widgets/order_item.dart';

class OrdersScreen extends StatelessWidget {
  static String routeName = '/orders-screen';

  @override
  Widget build(BuildContext context) {
    final orders = Provider.of<Orders>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Your Orders'),
      ),
      body: ListView.builder(
        itemCount: orders.orders.length,
        itemBuilder: (context, index) => OrderItem(
          order: orders.orders[index],
        ),
      ),
      drawer: MainDrawer(),
    );
  }
}
