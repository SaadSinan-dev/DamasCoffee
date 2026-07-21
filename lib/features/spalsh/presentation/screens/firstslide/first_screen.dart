import 'package:flutter/material.dart';
import 'package:tamkeen_mini_project/core/theme/color/app_colors.dart';
import 'package:tamkeen_mini_project/core/routing/app_routes.dart';

class SplashScreen1 extends StatelessWidget {
  const SplashScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: AppColors.background),
        child: SafeArea(
            child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.center,
                clipBehavior: Clip.none,
                children: [
                  Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.accent,
                    ),
                  ),
                  Positioned(
                    top: -100,
                    left: -65,
                    child: Image.asset(
                      'assets/images/splash-1-.png',
                      width: 290,
                      height: 290,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 150,
              ),
              Text(
                'coffee first then talk !',
                style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                    fontSize: 24,
                    color: AppColors.secondary),
              ),
              SizedBox(
                height: 50,
              ),
              Image.asset('assets/images/beans-1-.png'),
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
                            context, AppRoutes.splash2);
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
