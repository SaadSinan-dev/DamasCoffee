import 'package:flutter/material.dart';
import 'package:tamkeen_mini_project/core/color/app_colors.dart';

class PointsBadge extends StatelessWidget {
  final int points;
  const PointsBadge({super.key, required this.points});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 70,
          height: 35,
          decoration: BoxDecoration(
            color: AppColors.textPrimary.withOpacity(0.2),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.white38),
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('$points', style: TextStyle(color: AppColors.textPrimary)),
            const SizedBox(width: 8),
            Icon(Icons.coffee, size: 18, color: AppColors.textPrimary),
          ],
        ),
      ],
    );
  }
}
