import 'package:flutter/material.dart';
import 'package:tamkeen_mini_project/core/theme/color/app_colors.dart';
import 'package:tamkeen_mini_project/core/routing/app_routes.dart';

class SplashScreen3 extends StatelessWidget {
  const SplashScreen3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Color.fromRGBO(249, 235, 208, 1)),
        child: SafeArea(
            child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/splash-3-.png',
                  width: double.infinity, fit: BoxFit.cover),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'so ',
                    style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                        fontSize: 24,
                        color: AppColors.secondary),
                  ),
                  Text(
                    'chafe ',
                    style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                        fontSize: 24,
                        color: AppColors.textPrimary),
                  ),
                  Text(
                    'will make you smile :) ',
                    style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                        fontSize: 24,
                        color: AppColors.secondary),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Image.asset('assets/images/beans-3-.png'),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          foregroundColor: Colors.white,
                          backgroundColor: AppColors.primary),
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                            context, AppRoutes.login);
                      },
                      child: Text('Next')),
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}
