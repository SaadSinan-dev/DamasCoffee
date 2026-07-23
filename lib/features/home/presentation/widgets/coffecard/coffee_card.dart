import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tamkeen_mini_project/Localization/l10n/app_localizations.dart';
import 'package:tamkeen_mini_project/core/routing/app_routes.dart';
import 'package:tamkeen_mini_project/core/theme/color/app_colors.dart';
import 'package:tamkeen_mini_project/features/home/data/coffee_data.dart';

class CoffeeCard extends StatelessWidget {
  const CoffeeCard({
    super.key,
    required this.coffee,
  });

  final CoffeeProduct coffee;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, AppRoutes.coffeedetails,
            arguments: coffee);
      },
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          Container(
            width: 150.w,
            height: 250.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20).r,
              color: Colors.white.withOpacity(0.07),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    margin: EdgeInsets.all(12).r,
                    width: 130.w,
                    height: 130.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(23).r,
                      image: DecorationImage(
                        image: AssetImage(coffee.imagePath),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 6.h,
                    right: 12.w,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: 50.w,
                          height: 30.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(32)),
                            image: const DecorationImage(
                              image: AssetImage('assets/images/angle.png'),
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              coffee.rate,
                              style: TextStyle(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            ),
                            SizedBox(
                              width: 6.w,
                            ),
                            Icon(
                              Icons.star,
                              size: 12,
                              color: AppColors.textPrimary,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(start: 14),
                child: Text(
                  l10n.cappuccino,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14.sp,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 4.h),
              Padding(
                padding: EdgeInsetsDirectional.only(start: 14),
                child: Text(
                  l10n.darkRoasted,
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
                          coffee.formattedPrice,
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 14.sp,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          color: AppColors.textPrimary,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(
                          Icons.add,
                          color: Colors.black,
                          size: 20,
                        ),
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
