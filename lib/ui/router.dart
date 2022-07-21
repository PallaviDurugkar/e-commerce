import 'package:e_commerce_project/onboarding/onboarding.dart';
import 'package:e_commerce_project/ui/auth/login_screen.dart';
import 'package:e_commerce_project/ui/auth/register_page.dart';
import 'package:e_commerce_project/ui/root.dart';
import 'package:e_commerce_project/ui/splash/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route<MaterialPageRoute> onNavigate(RouteSettings settings) {
    late final Widget selectedPage;

    switch (settings.name) {
      case SplashScreen.route:
        selectedPage = const SplashScreen();
        break;

      case LoginScreen.route:
        selectedPage = LoginScreen();
        break;

      case RegisterPage.route:
        selectedPage = RegisterPage();
        break;
        
      default:
        selectedPage = const Root();
        break;
    }
    return MaterialPageRoute(builder: (context) => selectedPage);
  }
}
