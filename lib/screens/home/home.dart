import 'package:flutter/material.dart';
import 'package:raramart/appbar.dart';
import 'package:raramart/details.dart';
import 'package:raramart/drawer.dart';
import 'package:raramart/utils/constants.dart';
import 'package:raramart/utils/size_config.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
      // drawer: MainDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _page,
        onTap: (index) {
          this._pageController.animateToPage(
                index,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
              );
        },
        items: <BottomNavigationBarItem>[
          new BottomNavigationBarItem(
            icon: new Icon(Icons.home_filled),
            label: "Home",
          ),
          new BottomNavigationBarItem(
            icon: new Icon(Icons.search),
            label: "Wishlist",
          ),
          new BottomNavigationBarItem(
            icon: new Icon(Icons.shopping_cart_outlined),
            label: "Cart",
          ),
          new BottomNavigationBarItem(
            icon: new Icon(Icons.account_circle_outlined),
            label: "Profile",
          ),
        ],
      ),
      body: new PageView(
        controller: _pageController,
        onPageChanged: (newPage) {
          setState(() {
            this._page = newPage;
          });
        },
        children: <Widget>[
          new Center(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Icon(Icons.supervised_user_circle),
                new Text("Home"),
              ],
            ),
          ),
          DetailsScreen(),
          new Center(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Icon(Icons.notifications),
                new Text("Cart"),
              ],
            ),
          ),
          new Center(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Icon(Icons.mail),
                new Text("Profile"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
