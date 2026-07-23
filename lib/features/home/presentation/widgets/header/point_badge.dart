import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tamkeen_mini_project/core/theme/color/app_colors.dart';

class PointsBadge extends StatelessWidget {
  final int points;
  const PointsBadge({super.key, required this.points});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70.w,
      height: 35.h,
      decoration: BoxDecoration(
        color: AppColors.textPrimary.withOpacity(0.2),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.white38),
      ),
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('$points', style: TextStyle(color: AppColors.textPrimary)),
            SizedBox(width: 8.w),
            Icon(Icons.coffee, size: 18.sp, color: AppColors.textPrimary),
          ],
        ),
      ),
    );
  }
}
