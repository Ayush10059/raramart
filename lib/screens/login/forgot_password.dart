import 'package:flutter/material.dart';
import 'package:raramart/models/login_model.dart';

import 'package:raramart/utils/constants.dart';
import 'package:raramart/utils/helper.dart';
import 'package:raramart/utils/progressHUD.dart';
import 'package:raramart/utils/size_config.dart';
import 'package:raramart/utils/validator.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

late LoginModel _forgotPasswordModel;

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  void initState() {
    super.initState();
    _forgotPasswordModel = new LoginModel();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    // TODO: API call
    return ProgressHUD(
      inAsyncCall: false,
      child: Form(
        key: _globalKey,
        child: Scaffold(
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
              onPressed: () {
                FocusScope.of(context).unfocus();
                Navigator.pop(context);
              },
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                getProportionateScreenWidth(20),
                getProportionateScreenHeight(10),
                getProportionateScreenWidth(40),
                getProportionateScreenHeight(10),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  kText(
                    text: "Forgot Password",
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(30),
                  ),
                  kTextField(
                    context,
                    onChanged: (String email) => {
                      _forgotPasswordModel.email = email,
                    },
                    onValidate: (String value) {
                      if (value.isEmpty) {
                        return "Please enter Email ID.";
                      }

                      if (value.isNotEmpty && !value.isValidEmail()) {
                        return "Please enter valid Email ID.";
                      }
                      return null;
                    },
                    hintText: "Email",
                    labelText: "Email",
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(20),
                  ),
                  kText(
                    text:
                        "Please enter your email address associated with your account",
                    fontSize: 12,
                    maxLines: 3,
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(20),
                  ),
                  kTextButton(
                    text: "Send Reset Email",
                    onPressed: () {
                      if (kValidateAndSave(_globalKey)) {}
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
