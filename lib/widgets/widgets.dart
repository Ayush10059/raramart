import 'package:flutter/material.dart';

import 'package:raramart/router.dart';

import 'package:raramart/models/products_model.dart';

import 'package:raramart/utils/constants.dart';
import 'package:raramart/utils/helper.dart';

Widget productScroll({
  required String labelName,
  required List<Product> productList,
  required Function onPressed,
}) {
  return Container(
    height: 200,
    margin: EdgeInsets.only(top: 10.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        header(
          text: labelName,
          onPressed: () {
            return onPressed();
          },
        ),
        Container(
          height: 170,
          child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            itemCount: productList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.5),
                child: ProductCard(product: productList[index]),
              );
            },
          ),
        ),
      ],
    ),
  );
}

Widget productGrid({
  required List<Product> productList,
}) {
  return GridView.builder(
    padding: const EdgeInsets.symmetric(horizontal: 20.0),
    shrinkWrap: true,
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      childAspectRatio: 1 / 1.5,
      crossAxisCount: 3,
      crossAxisSpacing: 5.0,
    ),
    physics: NeverScrollableScrollPhysics(),
    scrollDirection: Axis.vertical,
    itemCount: demoProducts.length,
    itemBuilder: (context, index) {
      return ProductCard(
        product: demoProducts[index],
      );
    },
  );
}

Widget header({
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

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: 120,
        decoration: kBoxDecoration(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 120,
              width: 120,
              decoration: kBoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    product.images[0],
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              child: kText(
                text: product.title,
                fontSize: 12,
                maxLines: 2,
              ),
            ),
            kText(
              text: '¥${product.price}',
              fontSize: 12,
              fontWeight: FontWeight.w600,
              textColor: kPrimaryColor.withOpacity(0.8),
            ),
          ],
        ),
      ),
      onTap: () => Navigator.pushNamed(
        context,
        details,
        arguments: {
          "product":
              "Unlocked original Apple iPhone 7plus 5.5 inch RAM 128 GB 12.0 MP Camera 4G LTE",
          "price": "¥ 30,000"
        },
      ),
    );
  }
}
