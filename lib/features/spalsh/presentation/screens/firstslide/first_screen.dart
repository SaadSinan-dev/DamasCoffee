import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tamkeen_mini_project/core/routing/app_routes.dart';
import 'package:tamkeen_mini_project/core/theme/color/app_colors.dart';

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
                    width: 200.w,
                    height: 200.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.accent,
                    ),
                  ),
                  Positioned(
                    top: -100.h,
                    left: -65.w,
                    child: Image.asset(
                      'assets/images/splash-1-.png',
                      width: 290.w,
                      height: 290.h,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 150.h,
              ),
              Text(
                'coffee first then talk !',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 24.sp,
                    color: AppColors.secondary),
              ),
              SizedBox(
                height: 50.h,
              ),
              Image.asset('assets/images/beans-1-.png'),
              SizedBox(
                height: 40.h,
              ),
              Padding(
                padding: const EdgeInsets.all(25.0).r,
                child: SizedBox(
                  width: double.infinity,
                  height: 55.h,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10).r),
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
