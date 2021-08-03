import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:raramart/providers/cart_provider.dart';
import 'package:raramart/providers/wishlist_provider.dart';
import 'package:raramart/router.dart';
import 'package:raramart/screens/cart/cart.dart';
import 'package:raramart/screens/dashboard.dart';
import 'package:raramart/screens/wishlist.dart';

import 'package:raramart/utils/constants.dart';

import 'package:raramart/screens/splash.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CartNotifier(),
          child: CartScreen(),
        ),
        ChangeNotifierProvider(
          create: (context) => WishlistNotifier(),
          child: WishlistScreen(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rara mart',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        splashColor: kLightGrey,
        scaffoldBackgroundColor: kWhite,
        appBarTheme: AppBarTheme(
          elevation: 0.0,
          backgroundColor: kWhite,
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: kPrimaryColor,
          showUnselectedLabels: true,
          selectedItemColor: kWhite,
          unselectedItemColor: kBlack,
          type: BottomNavigationBarType.fixed,
        ),
      ),
      onGenerateRoute: Routing.generateRoute,
      initialRoute: splash,
      home: DashboardScreen(),
    );
  }
}
