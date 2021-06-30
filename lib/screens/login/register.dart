import 'package:flutter/material.dart';
import 'package:raramart/models/login_model.dart';
import 'package:raramart/router.dart';

import 'package:raramart/utils/constants.dart';

import 'package:raramart/utils/helper.dart';
import 'package:raramart/utils/progressHUD.dart';

import 'package:raramart/utils/size_config.dart';

import 'package:raramart/utils/validator.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

late LoginModel _registerModel;

late bool _checked, _hidePassword, _hideConfirmPassword;

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  void initState() {
    super.initState();
    _checked = false;
    _hidePassword = true;
    _hideConfirmPassword = true;

    _registerModel = new LoginModel();
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
                    text: "Create new Account",
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(30),
                  ),
                  kTextField(
                    context,
                    onChanged: (String email) => {
                      _registerModel.email = email,
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
                    helperText: "Your email will be your username",
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(20),
                  ),
                  kTextField(
                    context,
                    onChanged: (String name) => {
                      _registerModel.name = name,
                    },
                    onValidate: (String value) {
                      if (value.isEmpty) {
                        return "Please enter you name.";
                      }
                      return null;
                    },
                    hintText: "Name",
                    labelText: "Name",
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(20),
                  ),
                  kTextField(
                    context,
                    onChanged: (String password) {
                      _registerModel.password = password;
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
                      color: kPrimaryColor.withOpacity(0.6),
                      icon: Icon(_hidePassword
                          ? Icons.visibility_off
                          : Icons.visibility),
                    ),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(20),
                  ),
                  kTextField(
                    context,
                    onChanged: (String confirmPassword) => {
                      _registerModel.confirmPassword = confirmPassword,
                    },
                    onValidate: (String value) {
                      if (value.isEmpty) {
                        return "Please confirm your password.";
                      }

                      if (value.isNotEmpty && value.length < 6) {
                        return "Password must be 6 characters long.";
                      }

                      if (value.isNotEmpty &&
                          value != _registerModel.password) {
                        return "Passwords do not match.";
                      }
                      return null;
                    },
                    hintText: "Confirm Password",
                    labelText: "Confirm Password",
                    obscureText: _hideConfirmPassword,
                    suffixIcon: IconButton(
                      onPressed: () => setState(
                          () => _hideConfirmPassword = !_hideConfirmPassword),
                      color: kPrimaryColor.withOpacity(0.6),
                      icon: Icon(_hideConfirmPassword
                          ? Icons.visibility_off
                          : Icons.visibility),
                    ),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(20),
                  ),
                  CheckboxListTile(
                    contentPadding: EdgeInsets.all(0.0),
                    value: _checked,
                    dense: true,
                    controlAffinity: ListTileControlAffinity.leading,
                    activeColor: kPrimaryColor,
                    title: kText(
                      text:
                          "I accept the Privacy Policy and agree to the Terms of Service",
                      fontSize: 12,
                      maxLines: 3,
                    ),
                    onChanged: (value) {
                      setState(() => _checked = value ?? false);
                    },
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(20),
                  ),
                  kButton(
                    text: "Register",
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                      if (kValidateAndSave(_globalKey) && _checked == true) {
                        // Navigator.pushNamed(context, registerSuccess);
                      }
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
