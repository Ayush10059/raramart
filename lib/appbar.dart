import 'package:flutter/material.dart';

PreferredSizeWidget buildAppBar(
  BuildContext context,
) {
  return AppBar(
    backgroundColor: Colors.white,
    title: Container(
      child: Image.asset("assets/images/raramart-logo.png"),
    ),
    iconTheme: IconThemeData(color: Colors.grey),
  );
}
