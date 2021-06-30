import 'package:flutter/material.dart';
import 'package:raramart/utils/constants.dart';

PreferredSizeWidget buildAppBar(
  BuildContext context,
) {
  return AppBar(
    backgroundColor: kWhite,
    elevation: 0.0,
    title: Container(
      child: Image.asset("assets/images/raramart-logo.png"),
    ),
    centerTitle: true,
    iconTheme: IconThemeData(color: kDarkGrey),
  );
}
