import 'package:flutter/material.dart';
import 'package:tamkeen_mini_project/core/routing/app_transitions.dart';
import 'package:tamkeen_mini_project/features/admin/presentation/screens/admin_login_screen.dart';
import 'package:tamkeen_mini_project/features/admin/presentation/screens/admin_screen.dart';
import 'package:tamkeen_mini_project/features/auth/presentation/login/login_screen.dart';
import 'package:tamkeen_mini_project/features/auth/presentation/register/register_screen.dart';
import 'package:tamkeen_mini_project/features/checkout/presentation/screens/checkout_screen.dart';
import 'package:tamkeen_mini_project/features/home/data/beans_data.dart';
import 'package:tamkeen_mini_project/features/home/data/coffee_data.dart';
import 'package:tamkeen_mini_project/features/home/presentation/screens/beans_details_screen.dart';
import 'package:tamkeen_mini_project/features/home/presentation/screens/coffee_details_screen.dart';
import 'package:tamkeen_mini_project/features/home/presentation/screens/main_screen.dart';
import 'package:tamkeen_mini_project/features/home/presentation/wireframe/home_screen_wire_frame.dart';
import 'package:tamkeen_mini_project/features/spalsh/presentation/screens/firstslide/first_screen.dart';
import 'package:tamkeen_mini_project/features/spalsh/presentation/screens/secondslide/second_screen.dart';
import 'package:tamkeen_mini_project/features/spalsh/presentation/screens/thirdslide/third_screen.dart';

class AppRoutes {
  AppRoutes._();

  static const String splash1 = '/landing1';
  static const String splash2 = '/landing2';
  static const String splash3 = '/landing3';
  static const String login = '/login';
  static const String register = '/register';
  static const String home = '/home';
  static const String homewireframe = '/homewireframe';
  static const String checkout = '/checkout';
  static const String coffeedetails = '/coffeedetails';
  static const String beansdetails = '/beansdetails';
  static const String admin = '/admin';
  static const String adminlogin = '/adminlogin';
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case admin:
        return AppTransitions.slide(
          AdminScreen(),
        );
      case adminlogin:
        return AppTransitions.slide(
          const AdminLoginScreen(),
        );
      case splash1:
        return AppTransitions.slide(
          const SplashScreen1(),
        );

      case splash2:
        return AppTransitions.slide(
          const SplashScreen2(),
        );

      case splash3:
        return AppTransitions.slide(
          const SplashScreen3(),
        );

      case login:
        return AppTransitions.fade(
          const LoginScreen(),
        );

      case register:
        return AppTransitions.slide(
          const RegisterScreen(),
        );

      case home:
        return AppTransitions.fade(
          const MainScreen(),
        );

      case homewireframe:
        return AppTransitions.fade(
          const HomeWireframe(),
        );

      case checkout:
        return AppTransitions.slide(
          const CheckoutScreen(),
        );

      case coffeedetails:
        final args = settings.arguments;

        if (args is CoffeeProduct) {
          return AppTransitions.slide(
            CoffeeDetailsScreen(coffee: args),
          );
        }

        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text('Error: Product data not found'),
            ),
          ),
        );

      case beansdetails:
        final args = settings.arguments;

        if (args is BeanProduct) {
          return AppTransitions.slide(
            BeansDetailsScreen(bean: args),
          );
        }

        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text('Error: Product data not found'),
            ),
          ),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text('Route not found'),
            ),
          ),
        );
    }
  }
}
