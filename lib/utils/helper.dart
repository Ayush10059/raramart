import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:raramart/utils/constants.dart';
import 'package:raramart/utils/size_config.dart';

Text kText({
  required String text,
  String fontFamily = 'ProximaNova',
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
  String fontFamily = 'ProximaNova',
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
  required String hintText,
  String? labelText,
  String? helperText,
  bool obscureText = false,
  Icon? prefixIcon,
  IconButton? suffixIcon,
  double borderRadius = 4.0,
  bool autofocus = false,
}) {
  return TextFormField(
    decoration: kFieldDecoration(
      context,
      labelText: labelText,
      hintText: hintText,
      helperText: helperText,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      borderRadius: borderRadius,
    ),
    autofocus: autofocus,
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
  String? labelText,
  String? helperText,
  Icon? prefixIcon,
  IconButton? suffixIcon,
  double borderRadius = 4.0,
}) {
  return InputDecoration(
    isDense: true,
    labelText: labelText,
    labelStyle: kTextStyle(textColor: kDarkGrey),
    hintText: hintText,
    helperText: helperText,
    prefixIcon: prefixIcon,
    suffixIcon: suffixIcon,
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: kLightGrey,
        width: 1.0,
      ),
      borderRadius: BorderRadius.circular(borderRadius),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: kPrimaryColor,
        width: 1.0,
      ),
      borderRadius: BorderRadius.circular(borderRadius),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: kPrimaryColor,
        width: 1.0,
      ),
      borderRadius: BorderRadius.circular(borderRadius),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: kPrimaryColor,
        width: 1.0,
      ),
      borderRadius: BorderRadius.circular(borderRadius),
    ),
  );
}

BoxDecoration kBoxDecoration({
  Color color = kWhite,
  double borderRadius = 4.0,
  BoxShape shape = BoxShape.rectangle,
  DecorationImage? image,
  Color borderColor = kWhite,
  double borderWidth = 0.0,
}) {
  return BoxDecoration(
    color: color,
    borderRadius: (shape == BoxShape.rectangle)
        ? BorderRadius.circular(borderRadius)
        : null,
    shape: shape,
    image: image,
    border: Border.all(
      color: borderColor,
      width: borderWidth,
    ),
  );
}

Container kButton({
  required String text,
  required Function onPressed,
  double height = 60,
  double width = 375,
  Color textColor = kWhite,
  Color bgColor = kPrimaryColor,
}) {
  return Container(
    height: getProportionateScreenHeight(height),
    width: getProportionateScreenWidth(width),
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

Container kTextButton({
  required String text,
  required Function onPressed,
}) {
  return Container(
    height: 30,
    child: TextButton(
      style: TextButton.styleFrom(
        visualDensity: VisualDensity.compact,
        padding: EdgeInsets.all(0.0),
      ),
      onPressed: () {
        return onPressed();
      },
      child: kText(
        text: text,
        fontSize: 12,
        fontWeight: FontWeight.w600,
      ),
    ),
  );
}

Container kIconButton({
  required IconData icon,
  required Function onPressed,
  double size = 40,
}) {
  return Container(
    width: size,
    child: IconButton(
      splashRadius: size,
      visualDensity: VisualDensity.compact,
      padding: EdgeInsets.all(0.0),
      onPressed: () {
        return onPressed();
      },
      icon: Icon(icon),
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

void showMessageDialog(
  BuildContext context,
  String title,
  Widget content,
  String buttonText,
  Function onPressed,
) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return WillPopScope(
        onWillPop: () async => false,
        child: AlertDialog(
          title: kText(text: title),
          content: content,
          actions: [
            kTextButton(
              text: buttonText,
              onPressed: () {
                return onPressed();
              },
            ),
          ],
        ),
      );
    },
  );
}

// TODO: test
void showConfirmationDialog(
  BuildContext context,
  String title,
  Widget? content,
  String buttonText1,
  Function onPressed1,
  String buttonText2,
  Function onPressed2,
) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return WillPopScope(
        onWillPop: () async => false,
        child: AlertDialog(
          title: kText(text: title),
          content: content,
          actions: [
            new TextButton(
              onPressed: () {
                return onPressed1();
              },
              child: kText(text: buttonText1),
            ),
            new TextButton(
              onPressed: () {
                return onPressed2();
              },
              child: kText(text: buttonText2),
            )
          ],
        ),
      );
    },
  );
}

void showSnackBar(
  BuildContext context, {
  required String text,
  double fontSize = 18,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: kText(
        text: text,
        fontSize: fontSize,
        textColor: kWhite,
      ),
    ),
  );
}
