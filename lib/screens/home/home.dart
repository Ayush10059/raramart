import 'package:flutter/material.dart';
import 'package:raramart/router.dart';

import 'package:raramart/screens/home/sliderBanner.dart';
import 'package:raramart/screens/home/searchField.dart';
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
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Column(
          children: [
            SizedBox(height: 15.0),
            SearchField(),
            SizedBox(height: 10.0),
            CategoryWidget(),
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
      ),
    );
  }
}
