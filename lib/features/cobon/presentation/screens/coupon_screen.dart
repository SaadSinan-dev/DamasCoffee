import 'package:flutter/material.dart';
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
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CouponHeader(),
              const SizedBox(height: 54),
              const CustomerCard(),
              const SizedBox(height: 28),
              const SectionLabel(title: 'My Coupons'),
              const SizedBox(height: 26),
              ...CouponData.coupons.map(
                (coupon) => Padding(
                  padding: const EdgeInsets.only(bottom: 16),
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
