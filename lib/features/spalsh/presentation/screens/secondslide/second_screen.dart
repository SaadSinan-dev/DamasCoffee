import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tamkeen_mini_project/core/routing/app_routes.dart';
import 'package:tamkeen_mini_project/core/theme/color/app_colors.dart';

class SplashScreen2 extends StatelessWidget {
  const SplashScreen2({super.key});

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
              Image.asset('assets/images/splash-2-.png',
                  width: double.infinity, fit: BoxFit.cover),
              SizedBox(
                height: 150.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'just one ',
                    style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                        fontSize: 24.sp,
                        color: AppColors.secondary),
                  ),
                  Stack(
                    children: [
                      Text(
                        'sip',
                        style: TextStyle(

                            fontWeight: FontWeight.w500,
                            fontSize: 24.sp,
                            color: AppColors.textPrimary),
                      ),
                      Image.asset('assets/images/splash-2l-.png')
                    ],
                  ),
                  Text(
                    ' and feel good',
                    style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                        fontSize: 24.sp,
                        color: AppColors.secondary),
                  ),
                ],
              ),
              SizedBox(
                height: 50.h,
              ),
              Image.asset('assets/images/beans-2-.png'),
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
                            context, AppRoutes.splash3);
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
