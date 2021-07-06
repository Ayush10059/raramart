import 'dart:async';

import 'package:flutter/material.dart';

import 'package:raramart/router.dart';
import 'package:raramart/utils/constants.dart';
import 'package:raramart/utils/helper.dart';
import 'package:raramart/utils/size_config.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 2),
      () => Navigator.pushReplacementNamed(
        context,
        dashboard,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: kWhite,
      body: Center(
        child: Container(
          width: getProportionateScreenWidth(300),
          decoration: kBoxDecoration(
            borderRadius: 0.0,
            image: DecorationImage(
              image: AssetImage('assets/images/rara japan logo-02.png'),
            ),
          ),
        ),
      ),
    );
  }
}
