import 'package:flutter/material.dart';
import 'package:forthapp/providers/cart.dart';
import 'package:forthapp/providers/orders.dart';
import 'package:provider/provider.dart';
import '../widgets/cart_item.dart' as ci;

class CartScreen extends StatelessWidget {
  static const routeName = "/cart";
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(title: Text("your cart")),
      body: Column(children: <Widget>[
        Card(
          margin: EdgeInsets.all(15),
          child: Padding(
            padding: EdgeInsets.all(9),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Total",
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  width: 20,
                ),
                Chip(
                  label: Text("\$${cart.totalAmount}"),
                  backgroundColor: Theme.of(context).primaryColor,
                ),
                FlatButton(
                  child: Text("order now"),
                  onPressed: () {
                    Provider.of<Orders>(context,listen: false).addOrder(
                      cart.items.values.toList(),
                      cart.totalAmount,
                    );
                    cart.clear();
                  },
                  textColor: Theme.of(context).primaryColor,
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Expanded(
            child: ListView.builder(
                itemCount: cart.items.length,
                itemBuilder: (ctx, i) => ci.CartItemWidget(
                      cart.items.values.toList()[i].id as String,
                      cart.items.keys.toList()[i],
                      cart.items.values.toList()[i].price as double,
                      cart.items.values.toList()[i].quantity as int,
                      cart.items.values.toList()[i].title as String,
                    )))
      ]),
    );
  }
}
