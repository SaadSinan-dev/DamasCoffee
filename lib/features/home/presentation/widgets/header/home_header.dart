import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tamkeen_mini_project/Localization/l10n/app_localizations.dart';
import 'package:tamkeen_mini_project/core/localization/cubit/locale_cubit.dart';
import 'package:tamkeen_mini_project/core/theme/color/app_colors.dart';
import 'package:tamkeen_mini_project/features/home/presentation/widgets/header/point_badge.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top + 16,
        bottom: 24.h,
        left: 20.w,
        right: 20.w,
      ),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24).r,
          bottomRight: Radius.circular(24).r,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            l10n.profile,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          Container(
            width: 50.w,
            height: 35.h,
            decoration: BoxDecoration(
              color: AppColors.textPrimary.withOpacity(0.2),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.white38),
            ),
            child: IconButton(
              icon: const Icon(
                Icons.language,
                color: AppColors.textPrimary,
              ),
              onPressed: () {
                context.read<LocaleCubit>().toggleLanguage();
              },
            ),
          ),
          PointsBadge(points: 256),
        ],
      ),
    );
  }
}
