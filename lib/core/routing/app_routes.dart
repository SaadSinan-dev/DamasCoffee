import 'package:flutter/material.dart';
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

  static Map<String, WidgetBuilder> routes = {
    splash1: (context) => const SplashScreen1(),
    splash2: (context) => const SplashScreen2(),
    splash3: (context) => const SplashScreen3(),
    login: (context) => const LoginScreen(),
    checkout: (context) => const CheckoutScreen(),
    register: (context) => const RegisterScreen(),
    home: (context) => const MainScreen(),
    homewireframe: (context) => const HomeWireframe(),
    coffeedetails: (context) {
      final args = ModalRoute.of(context)!.settings.arguments;
      if (args is CoffeeProduct) {
        return CoffeeDetailsScreen(coffee: args);
      }
      return const Scaffold(
        body: Center(child: Text('Error: Product data not found')),
      );
    },
    beansdetails: (context) {
      final args = ModalRoute.of(context)!.settings.arguments;

      if (args is BeanProduct) {
        return BeansDetailsScreen(bean: args);
      }

      return const Scaffold(
        body: Center(child: Text('Error: Product data not found')),
      );
    },
  };
}
