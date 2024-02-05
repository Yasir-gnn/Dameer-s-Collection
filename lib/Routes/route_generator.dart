//import 'package:dameer_collection/Model/ItemsModel.dart';
import 'package:dameer_collection/Routes/app_navigation_routes.dart';
import 'package:dameer_collection/Screens/Accessories/accessories.dart';
import 'package:dameer_collection/Screens/Beauty/beauty.dart';
import 'package:dameer_collection/Screens/Homepage/homepage.dart';
import 'package:dameer_collection/Screens/Intro/intro.dart';
import 'package:dameer_collection/Screens/Login/loginScreen.dart';
import 'package:dameer_collection/Screens/Login/signUp.dart';
import 'package:dameer_collection/Screens/Men_Screen/men_screen.dart';
import 'package:dameer_collection/Screens/Welcome/welcome.dart';
import 'package:dameer_collection/Screens/forgetPassword/forget_password.dart';
import 'package:dameer_collection/Screens/intro1/intro1.dart';
import 'package:dameer_collection/Screens/intro2/intro2.dart';
//import 'package:dameer_collection/Screens/singleClass/singleClass.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppNavRoutes.initialRoute:
        return routeScreen(child: const welcome());
      case AppNavRoutes.welcome:
        return routeScreen(child: const welcome());
      case AppNavRoutes.intro:
        return routeScreen(child: const intro());
      case AppNavRoutes.intro1:
        return routeScreen(child: const intro1());
      case AppNavRoutes.intro2:
        return routeScreen(child: const intro2());
      case AppNavRoutes.signUp:
        return routeScreen(child: const signUp());
      case AppNavRoutes.loginScreen:
        return routeScreen(child: const loginScreen());
      case AppNavRoutes.homepage:
        return routeScreen(child: const homepage());
      case AppNavRoutes.ForgetPassword:
        return routeScreen(child: const ForgetPassword());
      case AppNavRoutes.menScreen:
        return routeScreen(child: const menScreen());
      case AppNavRoutes.accessories:
        return routeScreen(child: const accessories());
      case AppNavRoutes.beauty:
        return routeScreen(child: const beauty());
      // case AppNavRoutes.singleClass:
      //   return routeScreen(child: const singleClass(itemsModel: ,));

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return const Text('Error Routing');
    });
  }

  static Route<dynamic> routeScreen(
      {Widget? child, bool fullscreenDialog = false}) {
    return MaterialPageRoute(
      builder: (context) => SafeArea(
        child: child!,
      ),
    );
  }
}
