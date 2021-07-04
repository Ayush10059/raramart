import 'package:flutter/material.dart';

import 'package:raramart/router.dart';

import 'package:raramart/models/product_model.dart';

import 'package:raramart/utils/constants.dart';
import 'package:raramart/utils/helper.dart';

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
                  image: NetworkImage(
                    product.images?[0].src ?? '',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              child: kText(
                text: product.name ?? '',
                fontSize: 12,
                maxLines: 2,
              ),
            ),
            kText(
              text: "¥ ${product.price}",
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
          "product": product,
        },
      ),
    );
  }
}
