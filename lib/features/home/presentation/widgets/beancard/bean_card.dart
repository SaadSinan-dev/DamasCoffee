import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tamkeen_mini_project/Localization/l10n/app_localizations.dart';
import 'package:tamkeen_mini_project/core/routing/app_routes.dart';
import 'package:tamkeen_mini_project/core/theme/color/app_colors.dart';
import 'package:tamkeen_mini_project/features/home/data/beans_data.dart';

class BeanCard extends StatelessWidget {
  final BeanProduct bean;
  const BeanCard({super.key, required this.bean});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, AppRoutes.beansdetails, arguments: bean);
      },
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          Container(
            width: 150.w,
            height: 250.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(23).r,
              color: Colors.white.withOpacity(0.07),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.all(10).r,
                width: 130.w,
                height: 130.h,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(bean.imagePath),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(start: 14.r),
                child: Text(
                  l10n.arabicaBeans,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14.sp,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 4.h),
              Padding(
                padding: EdgeInsetsDirectional.only(start: 14.r),
                child: Text(
                  l10n.mediumRoasted,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 10.sp,
                    color: Colors.white60,
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12).r,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          '\$',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 14.sp,
                            color: Color(0xFFD4A853),
                          ),
                        ),
                        SizedBox(width: 2.w),
                        Text(
                          bean.price.toStringAsFixed(2),
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 14.sp,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 50.w,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 30.w,
                        height: 30.h,
                        decoration: BoxDecoration(
                          color: AppColors.textPrimary,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(Icons.add,
                            color: Colors.black, size: 20),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
