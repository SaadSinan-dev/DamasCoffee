import 'package:flutter/material.dart';
import 'package:tamkeen_mini_project/core/theme/color/app_colors.dart';
import 'package:tamkeen_mini_project/features/home/data/filters_data.dart';

class FilterChips extends StatelessWidget {
  final int selected;
  final ValueChanged<int> onSelect;

  const FilterChips(
      {super.key, required this.selected, required this.onSelect});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: List.generate(filters.length, (i) {
            final isSelected = selected == i;
            return GestureDetector(
              onTap: () => onSelect(i),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                margin: const EdgeInsets.only(right: 10),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                decoration: BoxDecoration(
                  color: isSelected
                      ? AppColors.textPrimary.withOpacity(0.3)
                      : Colors.white.withOpacity(0.04),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  filters[i],
                  style: TextStyle(
                    color: isSelected ? AppColors.textPrimary : Colors.white60,
                    fontWeight:
                        isSelected ? FontWeight.bold : FontWeight.normal,
                    fontFamily: 'Inter',
                    fontSize: 14,
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
