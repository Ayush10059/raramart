import 'package:flutter/material.dart';
import 'package:raramart/utils/constants.dart';
import 'package:raramart/utils/helper.dart';
import 'package:raramart/utils/size_config.dart';

PreferredSizeWidget buildAppBar(
  BuildContext context,
) {
  return AppBar(
    backgroundColor: kWhite,
    elevation: 0.0,
    title: Padding(
      padding: EdgeInsets.all(20.0),
      child: Container(
        width: getProportionateScreenWidth(200),
        child: Image.asset('assets/images/rara japan logo-02.png'),
        // decoration: kBoxDecoration(
        //   borderRadius: 0.0,
        //   image: DecorationImage(
        //     image: AssetImage('assets/images/rara japan logo-02.png'),
        //   ),
        // ),
      ),
    ),
    centerTitle: true,
    iconTheme: IconThemeData(color: kDarkGrey),
  );
}
