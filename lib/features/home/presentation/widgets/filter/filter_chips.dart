import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      padding: EdgeInsets.only(top: 16).r,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 20).r,
        child: Row(
          children: List.generate(filters.length, (i) {
            final isSelected = selected == i;
            return GestureDetector(
              onTap: () => onSelect(i),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                margin: EdgeInsets.only(right: 10).r,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8).r,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.04),
                  borderRadius: BorderRadius.circular(20).r,
                ),
                child: Column(
                  children: [
                    Text(
                      filters[i],
                      style: TextStyle(
                        color:
                            isSelected ? AppColors.textPrimary : Colors.white60,
                        fontWeight:
                            isSelected ? FontWeight.bold : FontWeight.normal,
                        fontFamily: 'Inter',
                        fontSize: 14.sp,
                      ),
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                    Container(
                      width: isSelected ? 8.w : 0.w,
                      height: isSelected ? 8.h : 0.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: isSelected
                              ? AppColors.textPrimary
                              : Colors.white60),
                    )
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
