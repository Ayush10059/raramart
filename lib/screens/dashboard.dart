import 'package:flutter/material.dart';
import 'package:raramart/screens/favorites.dart';

import 'package:raramart/utils/constants.dart';
import 'package:raramart/utils/size_config.dart';

import 'package:raramart/screens/home/home.dart';
import 'package:raramart/screens/cart/cart.dart';
import 'package:raramart/screens/login/login.dart';

import 'package:raramart/widgets/appbar.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _page = 0;
  late PageController _pageController;
  @override
  void initState() {
    super.initState();

    _pageController = new PageController(
      initialPage: _page,
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: buildAppBar(context),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _page,
        onTap: (index) {
          this._pageController.animateToPage(
                index,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
              );
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: 'Profile',
          )
        ],
        backgroundColor: kPrimaryColor,
        selectedItemColor: kWhite,
        unselectedItemColor: kBlack,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (newPage) {
          setState(() {
            this._page = newPage;
          });
        },
        children: [
          HomeScreen(),
          WishListScreen(),
          CartScreen(),
          LoginScreen(),
        ],
      ),
    );
  }
}
