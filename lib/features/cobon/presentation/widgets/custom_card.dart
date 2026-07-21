import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tamkeen_mini_project/core/theme/color/app_colors.dart';

class CustomerCard extends StatelessWidget {
  const CustomerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20).r,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.07),
        borderRadius: BorderRadius.circular(20).r,
        border: Border.all(color: Colors.white24, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 55.w,
                height: 55.h,
                decoration: BoxDecoration(
                  color: AppColors.textPrimary.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.person,
                    color: AppColors.textPrimary, size: 28.r),
              ),
              SizedBox(width: 16.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Ahmed Al-Rashid',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Inter',
                    ),
                  ),
                  SizedBox(height: 6.h),
                  Text(
                    '+951645454',
                    style: TextStyle(
                      color: Colors.white38,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 20.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 25, right: 25).r,
                child: Text(
                  'My Total Beans',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      '256',
                      style: TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(width: 6.w),
                    Icon(Icons.coffee, color: AppColors.textPrimary),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Padding(
            padding: EdgeInsets.only(left: 25, right: 25).r,
            child: Text(
              'Collect more beans to unlock coupons',
              style: TextStyle(
                color: AppColors.background,
                fontSize: 13.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(height: 10.h),
          Padding(
            padding: EdgeInsets.only(left: 25, right: 25),
            child: Divider(thickness: 2, color: AppColors.textPrimary),
          ),
          SizedBox(height: 10.h),
          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: Size(260.w, 45.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10).r,
                ),
                foregroundColor: AppColors.secondary,
                backgroundColor: AppColors.background,
              ),
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.qr_code,
                    color: AppColors.primary,
                  ),
                  SizedBox(
                    width: 12.w,
                  ),
                  Text(
                    "Scan me",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16.sp,
                        color: AppColors.secondary),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
