import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:raramart/router.dart';

import 'package:raramart/screens/home/sliderBanner.dart';
import 'package:raramart/screens/home/searchField.dart';
import 'package:raramart/utils/constants.dart';
import 'package:raramart/utils/helper.dart';
import 'package:raramart/widgets/category_widget.dart';
import 'package:raramart/widgets/product_grid.dart';
import 'package:raramart/widgets/product_scroll.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 15.0),
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, search),
            child: Container(
                height: 50.0,
                margin: kPadding,
                decoration: kBoxDecoration(
                  borderRadius: 20.0,
                  borderColor: kLightGrey,
                  borderWidth: 2.0,
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 14.0,
                    ),
                    Icon(
                      Icons.search,
                      color: kDarkGrey.withOpacity(0.5),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    kText(
                      text: "Search",
                      textColor: kDarkGrey,
                    ),
                  ],
                )),
          ),
          SizedBox(height: 10.0),
          categoryCircleImage(context),
          SizedBox(height: 10.0),
          SliderBanner(),
          SizedBox(height: 10.0),
          ProductScroll(
            labelName: "Homekeeping",
            categoryId: "102",
            onPressed: () {
              Navigator.pushNamed(
                context,
                more,
                arguments: {
                  "labelName": "Homekeeping",
                  "categoryId": "102",
                },
              );
            },
          ),
          SizedBox(height: 10.0),
          ProductScroll(
            labelName: "Accessories",
            categoryId: "25",
            onPressed: () {
              Navigator.pushNamed(
                context,
                more,
                arguments: {
                  "labelName": "Accessories",
                  "categoryId": "25",
                },
              );
            },
          ),
          SizedBox(height: 10.0),
          ProductGrid(
            labelName: "Audio & Video",
            categoryId: "26",
            onPressed: () {
              Navigator.pushNamed(
                context,
                more,
                arguments: {
                  "labelName": "Audio & Video",
                  "categoryId": "26",
                },
              );
            },
          )
        ],
      ),
    );
  }
}
