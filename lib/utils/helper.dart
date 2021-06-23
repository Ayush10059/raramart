import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:raramart/utils/constants.dart';
import 'package:raramart/utils/size_config.dart';

Text kText({
  required String text,
  String fontFamily = 'Roboto',
  Color textColor = kBlack,
  double fontSize = 14,
  FontWeight fontWeight = FontWeight.normal,
  int maxLines = 1,
  TextOverflow overflow = TextOverflow.clip,
  TextAlign textAlign = TextAlign.start,
}) {
  return Text(
    text,
    style: kTextStyle(
      fontFamily: fontFamily,
      textColor: textColor,
      fontSize: fontSize,
      fontWeight: fontWeight,
    ),
    maxLines: maxLines,
    overflow: overflow,
    textAlign: textAlign,
  );
}

TextStyle kTextStyle({
  String fontFamily = 'Roboto',
  Color textColor = kBlack,
  double fontSize = 14,
  FontWeight fontWeight = FontWeight.normal,
}) {
  return TextStyle(
    fontFamily: fontFamily,
    fontSize: getProportionateScreenWidth(fontSize),
    fontWeight: fontWeight,
    color: textColor,
  );
}

TextFormField kTextField(
  BuildContext context, {
  required Function onChanged,
  required Function onValidate,
  required String labelText,
  required String hintText,
  String? helperText,
  bool obscureText = false,
  IconButton? suffixIcon,
}) {
  return TextFormField(
    decoration: kFieldDecoration(
      context,
      labelText: labelText,
      hintText: hintText,
      helperText: helperText,
      suffixIcon: suffixIcon,
    ),
    maxLengthEnforcement: MaxLengthEnforcement.enforced,
    obscureText: obscureText,
    keyboardType: TextInputType.text,
    onChanged: (String value) {
      return onChanged(value);
    },
    validator: (String? value) {
      return onValidate(value);
    },
  );
}

InputDecoration kFieldDecoration(
  BuildContext context, {
  required String hintText,
  required String labelText,
  String? helperText,
  IconButton? suffixIcon,
}) {
  return InputDecoration(
    isDense: true,
    labelText: labelText,
    labelStyle: kTextStyle(textColor: kDarkGrey),
    hintText: hintText,
    helperText: helperText,
    suffixIcon: suffixIcon,
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: kLightGrey,
        width: 2.0,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: kPrimaryColor,
        width: 2.0,
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: kPrimaryColor,
        width: 2.0,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: kPrimaryColor,
        width: 2.0,
      ),
    ),
  );
}

Container kTextButton({
  required String text,
  required Function onPressed,
  Color textColor = kWhite,
  Color bgColor = kPrimaryColor,
}) {
  return Container(
    height: getProportionateScreenHeight(50),
    width: getProportionateScreenWidth(375),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(4.0),
      color: bgColor,
      boxShadow: [
        BoxShadow(
          offset: Offset(0, 2),
          blurRadius: 8.0,
          color: kBlack.withOpacity(0.25),
        ),
      ],
    ),
    child: TextButton(
      onPressed: () {
        return onPressed();
      },
      child: kText(
        text: text,
        textColor: textColor,
        fontSize: 16,
        fontWeight: FontWeight.w700,
      ),
    ),
  );
}

bool kValidateAndSave(GlobalKey<FormState> globalKey) {
  final form = globalKey.currentState;
  if (form != null && form.validate()) {
    form.save();
    return true;
  }
  return false;
}
