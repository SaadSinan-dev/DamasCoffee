import 'package:flutter/material.dart';
import 'package:tamkeen_mini_project/core/routing/app_routes.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: AppRoutes.splash1,
      routes: AppRoutes.routes,
      locale: Locale("en"),
      supportedLocales: [Locale("en"), Locale("ar")],
      localizationsDelegates: const [],
      debugShowCheckedModeBanner: false,
    );
  }
}
