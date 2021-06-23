import 'package:flutter/material.dart';

import 'package:raramart/splash.dart';

import 'package:raramart/screens/login/login.dart';
import 'package:raramart/screens/login/register.dart';
import 'package:raramart/screens/login/register_success.dart';
import 'package:raramart/screens/login/forgot_password.dart';

import 'package:raramart/screens/home/home.dart';

import 'package:raramart/screens/profile/profile.dart';

const String splash = '/';

const String login = '/login ';
const String register = '/register ';
const String registerSuccess = '/registerSuccess ';
const String forgotPassword = '/forgotPassword ';

const String home = '/home ';
const String profile = '/home ';

class Routing {
  static Route<dynamic> generateRoute(RouteSettings screen) {
    switch (screen.name) {
      case splash:
        return getRouteFor(
          SplashScreen(),
        );

      case login:
        return getRouteFor(
          LoginScreen(),
        );

      case register:
        return getRouteFor(
          RegisterScreen(),
        );

      case registerSuccess:
        return getRouteFor(
          RegisterSuccessScreen(),
        );

      case forgotPassword:
        return getRouteFor(
          ForgotPasswordScreen(),
        );

      case home:
        return getRouteFor(
          HomeScreen(),
        );

      case profile:
        return getRouteFor(
          ProfileScreen(),
        );

      // case details:
      //   final args = screen.arguments;
      //   if (args is Map) {
      //     return getRouteFor(
      //       DetailsScreen(
      //         product: args['product'],
      //         table: args['table'],
      //       ),
      //     );
      //   } else
      //     break;

      default:
        throw "Routing error";
    }
  }

  static Route<dynamic> getRouteFor(Widget widget) {
    return MaterialPageRoute(builder: (_) => widget);
  }
}
