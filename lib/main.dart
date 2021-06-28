import 'package:flutter/material.dart';
import 'package:raramart/screens/home/home.dart';
import 'package:raramart/utils/constants.dart';

void main() {
  runApp(MyApp());
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
      home: HomeScreen(),
    );
  }
}
