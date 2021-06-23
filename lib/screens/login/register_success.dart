import 'package:flutter/material.dart';

import 'package:raramart/utils/constants.dart';
import 'package:raramart/utils/helper.dart';
import 'package:raramart/utils/size_config.dart';

class RegisterSuccessScreen extends StatefulWidget {
  const RegisterSuccessScreen({Key? key}) : super(key: key);

  @override
  _RegisterSuccessScreenState createState() => _RegisterSuccessScreenState();
}

class _RegisterSuccessScreenState extends State<RegisterSuccessScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: kWhite,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: kWhite,
        leading: IconButton(
            splashRadius: 25.0,
            icon: Icon(
              Icons.arrow_back_ios_rounded,
              color: kBlack,
            ),
            onPressed: () => Navigator.pop(context)),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(
          getProportionateScreenWidth(20),
          getProportionateScreenHeight(10),
          getProportionateScreenWidth(40),
          getProportionateScreenHeight(10),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            kText(
              text: "Account Created",
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
            Spacer(flex: 1),
            kText(
              text:
                  "Please enter your email address associated with your account, Please enter your email address associated with your account",
              fontSize: 12,
              maxLines: 3,
            ),
            Spacer(flex: 9),
            kTextButton(
              text: "Continue",
              bgColor: kBlack,
              onPressed: () {},
            ),
            Spacer(flex: 3),
          ],
        ),
      ),
    );
  }
}
