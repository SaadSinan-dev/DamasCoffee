import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tamkeen_mini_project/core/theme/color/app_colors.dart';
import 'package:tamkeen_mini_project/features/cobon/data/coupon_data.dart';
import 'package:tamkeen_mini_project/features/cobon/presentation/widgets/coupon_card.dart';
import 'package:tamkeen_mini_project/features/cobon/presentation/widgets/custom_card.dart';
import 'package:tamkeen_mini_project/features/cobon/presentation/widgets/header.dart';
import 'package:tamkeen_mini_project/features/cobon/presentation/widgets/section_label.dart';

class CouponScreen extends StatelessWidget {
  const CouponScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CouponHeader(),
              SizedBox(height: 54.h),
              CustomerCard(),
              SizedBox(height: 28.h),
              SectionLabel(title: 'My Coupons'),
              SizedBox(height: 26.h),
              ...CouponData.coupons.map(
                (coupon) => Padding(
                  padding: EdgeInsets.only(bottom: 16).r,
                  child: CouponCard(coupon: coupon),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
