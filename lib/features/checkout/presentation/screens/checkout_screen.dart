import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tamkeen_mini_project/core/routing/app_routes.dart';
import 'package:tamkeen_mini_project/core/theme/color/app_colors.dart';
import 'package:tamkeen_mini_project/features/checkout/data/checkout_data.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 20.h),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        width: 40.w,
                        height: 40.h,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black26),
                          gradient: const LinearGradient(
                            colors: [
                              Color.fromRGBO(33, 38, 46, 1),
                              Color.fromRGBO(33, 38, 46, 0),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: Icon(
                          Icons.arrow_back_ios_new,
                          color: AppColors.textPrimary,
                          size: 18.r,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          'Payment',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22.sp,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Inter',
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 40.w),
                  ],
                ),
              ),
              SizedBox(height: 28.h),
              Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.r),
                        border: Border.all(color: AppColors.textPrimary)),
                    child: Padding(
                      padding: EdgeInsets.all(15.r),
                      child: Image.asset(
                        'assets/images/creaditcard.png',
                        width: 320.w,
                        height: 190.h,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 2.h, horizontal: 20.w),
                    child: Text(
                      'Credit Card',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Inter',
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 22.h, horizontal: 35.w),
                child: Column(
                  children: paymentOptions
                      .map((option) => Padding(
                            padding: EdgeInsets.only(bottom: 12.h),
                            child: Stack(
                              children: [
                                Container(
                                  width: double.infinity,
                                  height: 50.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25.r),
                                    gradient: const LinearGradient(colors: [
                                      Color.fromRGBO(38, 43, 51, 1),
                                      Color.fromRGBO(12, 15, 20, 1),
                                    ]),
                                  ),
                                ),
                                Positioned(
                                  top: 0,
                                  bottom: 0,
                                  left: 12.w,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        option['image']!,
                                        width: 28.w,
                                        height: 28.h,
                                      ),
                                      SizedBox(width: 8.w),
                                      Text(
                                        option['label']!,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'Inter',
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ))
                      .toList(),
                ),
              ),
              SizedBox(height: 50.h),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
                decoration: const BoxDecoration(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Total Price',
                          style: TextStyle(
                            color: Colors.white54,
                            fontSize: 13.sp,
                            fontFamily: 'Inter',
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Row(
                          children: [
                            Text(
                              '\$',
                              style: TextStyle(
                                color: AppColors.textPrimary,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Inter',
                              ),
                            ),
                            SizedBox(width: 6.w),
                            Text(
                              '120.7',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Inter',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.textPrimary,
                        foregroundColor: AppColors.primary,
                        padding: EdgeInsets.symmetric(
                            horizontal: 52.w, vertical: 14.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, AppRoutes.checkout);
                      },
                      child: Text(
                        'Pay from Credit Card',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Inter',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
