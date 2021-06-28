import 'package:flutter/material.dart';
import 'package:raramart/appbar.dart';
import 'package:raramart/details.dart';
import 'package:raramart/screens/home/components/homebody.dart';
import 'package:raramart/utils/size_config.dart';
// import 'package:raramart/drawer.dart';

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
      //body: HomeBody(),
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
              icon: Icon(Icons.account_circle_outlined), label: 'Profile')
        ],
        backgroundColor: Colors.orange,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black54,
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
          HomeBody(),
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
