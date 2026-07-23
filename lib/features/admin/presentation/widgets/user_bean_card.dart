import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tamkeen_mini_project/core/theme/color/app_colors.dart';
import 'package:tamkeen_mini_project/features/admin/data/admin_data.dart';

class UserBeanCard extends StatelessWidget {
  final UserBeanData user;

  const UserBeanCard({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14, vertical: 30).r,
      decoration: BoxDecoration(
        color: AppColors.accent,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 18,
                backgroundImage: NetworkImage(user.imageUrl),
                backgroundColor: AppColors.surface,
              ),
              const SizedBox(width: 10),
              Text(
                user.name,
                style: const TextStyle(
                  color: AppColors.background,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'My Total Beans',
                style: TextStyle(
                  color: AppColors.background,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Row(
                children: [
                  Text(
                    '${user.beans}',
                    style: const TextStyle(
                      color: AppColors.surface,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 6),
                  const Icon(Icons.eco, color: AppColors.surface, size: 20),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
