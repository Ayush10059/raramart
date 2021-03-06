import 'package:flutter/material.dart';
import 'package:raramart/models/login_model.dart';
import 'package:raramart/router.dart';

import 'package:raramart/utils/constants.dart';
import 'package:raramart/utils/progressHUD.dart';
import 'package:raramart/utils/size_config.dart';
import 'package:raramart/utils/helper.dart';
import 'package:raramart/utils/validator.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

late LoginModel _loginModel;

late bool _hidePassword;

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    super.initState();
    _loginModel = new LoginModel();
    _hidePassword = true;
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
          // TODO: change login
          // appBar: AppBar(
          //   elevation: 0.0,
          //   backgroundColor: kWhite,
          //   leading: IconButton(
          //     splashRadius: 25.0,
          //     icon: Icon(
          //       Icons.arrow_back_ios_rounded,
          //       color: kBlack,
          //     ),
          //     onPressed: () {
          //       FocusScope.of(context).unfocus();
          //       Navigator.pop(context);
          //     },
          //   ),
          // ),
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
                    text: "Login with Email",
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(30),
                  ),
                  kTextField(
                    context,
                    onChanged: (String email) => {
                      _loginModel.email = email,
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
                  kTextField(
                    context,
                    onChanged: (String password) => {
                      _loginModel.password = password,
                    },
                    onValidate: (value) {
                      if (value.isEmpty) {
                        return "Please enter your password.";
                      }

                      if (value.isNotEmpty && value.length < 6) {
                        return "Password must be 6 characters long.";
                      }
                      return null;
                    },
                    hintText: "Password",
                    labelText: "Password",
                    obscureText: _hidePassword,
                    suffixIcon: IconButton(
                      onPressed: () =>
                          setState(() => _hidePassword = !_hidePassword),
                      color: Theme.of(context).primaryColor.withOpacity(0.6),
                      icon: Icon(_hidePassword
                          ? Icons.visibility_off
                          : Icons.visibility),
                    ),
                  ),
                  Row(
                    children: [
                      TextButton(
                        child: kText(
                          text: "Forgot Password ?",
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                        onPressed: () => Navigator.pushNamed(
                          context,
                          forgotPassword,
                        ),
                      ),
                      Spacer(),
                      TextButton(
                        child: kText(
                          text: "Create account?",
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            register,
                          );
                        },
                      ),
                    ],
                  ),
                  kButton(
                    text: "Login",
                    onPressed: () {
                      //   if (kValidateAndSave(_globalKey)) {
                      //     Navigator.pushNamed(
                      //       context,
                      //       home,
                      //     );
                      //   }
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
