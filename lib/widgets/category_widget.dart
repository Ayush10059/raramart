import 'package:flutter/material.dart';
import 'package:raramart/router.dart';
import 'package:raramart/utils/constants.dart';

import 'package:raramart/utils/helper.dart';

Widget categoryCircleImage(BuildContext context) {
  List<Map<String, dynamic>> categoryicons = [
    {
      "icon": "assets/images/electronics.png",
      "text": "Electronics",
      "categoryId": "26",
    },
    {
      "icon": "assets/images/home-appliances.png",
      "text": "Home Keeping",
      "categoryId": "102",
    },
    {
      "icon": "assets/images/womens.png",
      "text": "Women's Fashion",
      "categoryId": '71',
    },
    {
      "icon": "assets/images/mens.png",
      "text": "Men's Fashion",
      "categoryId": "62",
    },
    {
      "icon": "assets/images/groceries.png",
      "text": "Groceries",
      "categoryId": '71',
    },
    {
      "icon": "assets/images/sports.png",
      "text": "Sports",
      "categoryId": '71',
    },
    {
      "icon": "assets/images/beauty.png",
      "text": "Beauty and Health",
      "categoryId": '71',
    },
  ];
  return Container(
    height: 100,
    child: ListView.builder(
      padding: kPadding,
      scrollDirection: Axis.horizontal,
      itemCount: categoryicons.length,
      itemBuilder: (context, index) => buildCategoryCard(
        context,
        category: categoryicons[index],
      ),
    ),
  );
}

buildCategoryCard(
  BuildContext context, {
  required category,
}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 5.0),
    child: GestureDetector(
      onTap: () {
        print('object');
        Navigator.pushNamed(
          context,
          more,
          arguments: {
            "labelName": category['text'],
            "categoryId": category['categoryId'],
          },
        );
      },
      child: Column(
        children: [
          Container(
            height: 60,
            width: 60,
            decoration: kBoxDecoration(
              color: kAmber.withOpacity(0.5),
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(category['icon']),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 5.0),
          Container(
            height: 20,
            width: 60,
            child: kText(
              text: category['text'],
              fontSize: 10,
              fontWeight: FontWeight.w600,
              textAlign: TextAlign.center,
              maxLines: 2,
            ),
          ),
        ],
      ),
    ),
  );
}
