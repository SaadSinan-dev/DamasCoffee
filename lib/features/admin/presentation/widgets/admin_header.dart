import 'package:flutter/material.dart';
import 'package:tamkeen_mini_project/core/theme/color/app_colors.dart';

class AdminHeader extends StatelessWidget {
  final String greetingName;
  final int points;

  const AdminHeader(
      {super.key, required this.greetingName, required this.points});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'HELLO $greetingName !',
          style: const TextStyle(
            color: AppColors.searchBox,
            fontWeight: FontWeight.bold,
            fontSize: 16,
            letterSpacing: 0.5,
          ),
        ),
        Row(
          children: [
            const Icon(Icons.person, color: AppColors.searchBox, size: 20),
            const SizedBox(width: 4),
            Text(
              '$points',
              style: const TextStyle(
                color: AppColors.searchBox,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
