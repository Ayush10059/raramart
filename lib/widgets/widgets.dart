import 'package:flutter/material.dart';
import 'package:raramart/models/product_model.dart';

import 'package:raramart/router.dart';

import 'package:raramart/utils/constants.dart';
import 'package:raramart/utils/helper.dart';

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
