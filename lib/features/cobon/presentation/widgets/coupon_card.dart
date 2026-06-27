// features/cobon/presentation/widgets/coupon_card.dart

import 'package:flutter/material.dart';
import 'package:tamkeen_mini_project/core/color/app_colors.dart';
import 'package:tamkeen_mini_project/features/cobon/data/coupon_data.dart';

class CouponCard extends StatelessWidget {
  final CouponModel coupon;

  const CouponCard({super.key, required this.coupon});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.07),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.white24, width: 1),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Text(
                      coupon.description,
                      style: const TextStyle(
                        color: AppColors.background,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(150, 30),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      foregroundColor: AppColors.secondary,
                      backgroundColor: AppColors.background,
                    ),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'more info',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: AppColors.secondary,
                          ),
                        ),
                        const SizedBox(width: 12),
                        const Icon(
                          Icons.arrow_forward_ios_outlined,
                          color: AppColors.primary,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Image.asset(coupon.imagePath),
            ],
          ),
        ),

        // Badge (only if badgeImagePath is provided)
        if (coupon.badgeImagePath != null)
          Padding(
            padding: const EdgeInsets.only(top: 22),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(coupon.badgeImagePath!),
                Text(
                  coupon.discount,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
