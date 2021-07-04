import 'package:flutter/material.dart';

import 'package:raramart/models/products_model.dart';

import 'package:raramart/screens/home/sliderBanner.dart';
import 'package:raramart/screens/home/searchField.dart';
import 'package:raramart/widgets/product_grid.dart';
import 'package:raramart/widgets/product_scroll.dart';
import 'package:raramart/widgets/widgets.dart';

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
          SearchField(),
          SizedBox(height: 10.0),
          SliderBanner(),
          SizedBox(height: 10.0),
          ProductScroll(
            labelName: "Homekeeping",
            categoryId: "102",
            onPressed: () {},
          ),
          SizedBox(height: 10.0),
          ProductScroll(
            labelName: "Accessories",
            categoryId: "25",
            onPressed: () {},
          ),
          SizedBox(height: 10.0),
          ProductGrid(
            labelName: "Audio & Video",
            categoryId: "26",
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
