import 'package:flutter/material.dart';
import 'package:forthapp/providers/cart.dart';
import 'package:forthapp/providers/orders.dart';
import 'package:forthapp/screens/cart_screen.dart';
import 'package:forthapp/screens/product_detail_screen.dart';
import 'package:provider/provider.dart';
import './screens/products_overwiev_screens.dart';
import './providers/products_provider.dart';
import './screens/orders_screen.dart';
import '../screens/user_product_screen.dart';
import '../screens/edit_product_screen.dart';
import '../screens/auth_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
          ChangeNotifierProvider.value(
      value: Products(),),
      ChangeNotifierProvider.value(
      value: Cart(),),
      ChangeNotifierProvider.value(value: Orders()),

    ],
    
      child: MaterialApp(
        title: 'MyShop',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.deepOrange,
        ),
        home: AuthScreen(),
        routes: {
          ProductDetailScreen.routeName: ((context) => ProductDetailScreen()),
          CartScreen.routeName:(context) => CartScreen(),
          OrdersScreen.routeName: ((context) => OrdersScreen()),
          UserProductsScreen.routeName:(context) => UserProductsScreen(),
          EditProductScreen.routeName:(context) => EditProductScreen()
        },
        
      ),
    );
  }
}

