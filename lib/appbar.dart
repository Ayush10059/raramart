import 'package:flutter/material.dart';

PreferredSizeWidget buildAppBar(
  BuildContext context,
) {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0.0,
    title: Container(
      child: Image.asset("assets/images/raramart-logo.png"),
    ),
    centerTitle: true,
    iconTheme: IconThemeData(color: Colors.grey),
  );
}
