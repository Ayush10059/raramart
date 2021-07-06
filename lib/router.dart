import 'package:flutter/material.dart';
import 'package:raramart/screens/dashboard.dart';
import 'package:raramart/screens/details/details.dart';
import 'package:raramart/screens/home/more.dart';

import 'package:raramart/screens/splash.dart';

import 'package:raramart/screens/login/login.dart';
import 'package:raramart/screens/login/register.dart';
import 'package:raramart/screens/login/register_success.dart';
import 'package:raramart/screens/login/forgot_password.dart';

const String splash = '/';

const String dashboard = '/dashboard';

const String login = '/login ';
const String register = '/register ';
const String registerSuccess = '/registerSuccess ';
const String forgotPassword = '/forgotPassword ';

const String details = '/details';

const String more = '/more';

class Routing {
  static Route<dynamic>? generateRoute(RouteSettings screen) {
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

      case dashboard:
        return getRouteFor(
          DashboardScreen(),
        );

      case details:
        final args = screen.arguments;
        if (args is Map) {
          return getRouteFor(
            DetailsScreen(
              product: args['product'],
            ),
          );
        } else
          break;

      case more:
        final args = screen.arguments;
        if (args is Map) {
          return getRouteFor(
            MoreScreen(
              labelName: args['labelName'],
              categoryId: args['categoryId'],
            ),
          );
        } else
          break;

      default:
        return getRouteFor(
          SplashScreen(),
        );
    }
  }

  static Route<dynamic> getRouteFor(Widget widget) {
    return MaterialPageRoute(builder: (_) => widget);
  }
}
