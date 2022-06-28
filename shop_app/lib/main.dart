import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/auth.dart';

import 'package:shop_app/providers/cart.dart';
import 'package:shop_app/providers/orders.dart';
import 'package:shop_app/screens/auth_screen.dart';
import 'package:shop_app/screens/cart_screen.dart';
import 'package:shop_app/screens/edit_product_screen.dart';
import 'package:shop_app/screens/orders_screen.dart';
import 'package:shop_app/screens/product_detail_screen.dart';
import 'package:shop_app/screens/products_overview_screen.dart';
import 'package:shop_app/providers/products_provider.dart';
import 'package:shop_app/screens/user_products_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Auth(),
        ),
        ChangeNotifierProxyProvider<Auth, Products>(
          create: (_) => Products('', []),
          update: (_, auth, previousProducts) => Products(
            auth.token as String,
            previousProducts == null ? [] : previousProducts.items,
          ),
        ),
        ChangeNotifierProvider.value(
          value: Cart(),
        ),
        ChangeNotifierProxyProvider<Auth, Orders>(
          create: (_) => Orders(
            '',
            [],
          ),
          update: (_, auth, previousOrders) => Orders(
            auth.token as String,
            previousOrders == null ? [] : previousOrders.orders,
          ),
        ),
      ],
      child: Consumer<Auth>(
        builder: (ctx, authData, _) => MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.purple,
            accentColor: Colors.deepOrange,
            fontFamily: 'Lato',
            textTheme: ThemeData.light().textTheme.copyWith(
                  bodyText1: TextStyle(
                    color: Theme.of(context).primaryColor,
                  ),
                  bodyText2: TextStyle(
                    color: Theme.of(context).primaryColor,
                  ),
                  headline6: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
          ),
          home: authData.isAuth ? ProductOverviewScreen() : AuthScreen(),
          routes: {
            ProductDetailScreen.routeName: (context) => ProductDetailScreen(),
            ProductOverviewScreen.routeName: (context) =>
                ProductOverviewScreen(),
            CartScreen.routeName: (context) => CartScreen(),
            OrdersScreen.routeName: (context) => OrdersScreen(),
            UserProductScreen.routeName: (context) => UserProductScreen(),
            EditProductScreen.routeName: (context) => EditProductScreen(),
          },
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}
