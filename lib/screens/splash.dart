import 'dart:async';

import 'package:flutter/material.dart';

import 'package:raramart/router.dart';
import 'package:raramart/utils/constants.dart';
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
          color: kWhite,
          child: Image.asset("assets/images/raramart-logo.png"),
        ),
      ),
    );
  }
}
