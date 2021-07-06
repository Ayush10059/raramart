import 'package:flutter/material.dart';
import 'package:raramart/utils/constants.dart';
import 'package:raramart/utils/helper.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({Key? key}) : super(key: key);

  @override
  _WishListScreenState createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 20.0,
            ),
            child: kText(
              text: "Favorites",
              fontSize: 18,
              textColor: kPrimaryColor.withOpacity(0.8),
              fontWeight: FontWeight.w600,
            ),
          ),
          // productGrid(
          //   productList: demoProducts,
          // ),
        ],
      ),
    );
  }
}
