import 'package:flutter/material.dart';
import 'package:tamkeen_mini_project/core/color/app_colors.dart';
import 'package:tamkeen_mini_project/features/home/data/beans_data.dart';

class SizeFilter extends StatefulWidget {
  const SizeFilter({super.key});

  @override
  State<SizeFilter> createState() => SizetFilterState();
}

class SizetFilterState extends State<SizeFilter> {
  int _selected = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(weights.length, (i) {
        final isSelected = _selected == i;
        return GestureDetector(
          onTap: () => setState(() => _selected = i),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: 100,
            height: 40,
            decoration: BoxDecoration(
              color: AppColors.searchBox,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: isSelected ? AppColors.textPrimary : Colors.black,
                width: 1.2,
              ),
            ),
            alignment: Alignment.center,
            child: Text(
              weights[i],
              style: TextStyle(
                color: isSelected ? AppColors.textPrimary : Colors.white60,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                fontSize: 14,
              ),
            ),
          ),
        );
      }),
    );
  }
}
