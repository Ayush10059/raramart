import 'package:flutter/material.dart';
import 'package:raramart/utils/constants.dart';
import 'package:raramart/utils/helper.dart';

AppBar buildDashboardAppBar(
  BuildContext context,
) {
  return AppBar(
    backgroundColor: kWhite,
    elevation: 0.0,
    title: Container(
      height: kToolbarHeight - 10,
      decoration: kBoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/raramart-logo.png"),
        ),
      ),
    ),
    automaticallyImplyLeading: false,
    centerTitle: true,
    iconTheme: IconThemeData(color: kDarkGrey),
  );
}

AppBar buildAppBar(
  BuildContext context,
) {
  return AppBar(
    backgroundColor: kWhite,
    elevation: 0.0,
    iconTheme: IconThemeData(color: kDarkGrey),
  );
}
