import 'package:flutter/material.dart';
import 'package:raramart/models/product_model.dart';

import 'package:raramart/utils/constants.dart';
import 'package:raramart/utils/helper.dart';
import 'package:raramart/utils/size_config.dart';
import 'package:raramart/widgets/product_card.dart';

Widget buildHeader({
  required String text,
  required Function onPressed,
}) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 20.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        kText(
          text: text,
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
        Container(
          height: 30,
          child: TextButton(
            child: kText(
              text: ">> See More",
              fontSize: 12,
              textColor: kPrimaryColor.withOpacity(0.8),
            ),
            onPressed: () {
              return onPressed();
            },
          ),
        ),
      ],
    ),
  );
}

Widget buildList(List<Product>? productList) {
  return (productList == null)
      ? Container(
          height: 180,
          decoration: kBoxDecoration(),
        )
      : Container(
          height: 180,
          child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            itemCount: productList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.0),
                child: ProductCard(product: productList[index]),
              );
            },
          ),
        );
}

Widget buildGrid(List<Product>? productList) {
  return (productList == null)
      ? Container(
          height: getProportionateScreenHeight(812),
          decoration: kBoxDecoration(),
        )
      : GridView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 1 / 1.6,
            crossAxisCount: 3,
            crossAxisSpacing: 8.0,
          ),
          physics: NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemCount: productList.length,
          itemBuilder: (context, index) {
            return ProductCard(
              product: productList[index],
            );
          },
        );
}
