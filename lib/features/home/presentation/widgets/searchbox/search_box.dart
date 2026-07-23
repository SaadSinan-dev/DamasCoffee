import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tamkeen_mini_project/Localization/l10n/app_localizations.dart';
import 'package:tamkeen_mini_project/core/theme/color/app_colors.dart';

class AppSearchBar extends StatelessWidget {
  final TextEditingController controller;
  const AppSearchBar({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Padding(
      padding: EdgeInsets.fromLTRB(30, 20, 30, 10).r,
      child: TextField(
        controller: controller,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: l10n.search,
          hintStyle: const TextStyle(color: Colors.white54),
          prefixIcon: const Icon(Icons.search, color: Colors.white54),
          filled: true,
          fillColor: AppColors.searchBox.withOpacity(0.5),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15).r,
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
