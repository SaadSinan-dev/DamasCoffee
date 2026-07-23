import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tamkeen_mini_project/core/theme/color/app_colors.dart';
import 'package:tamkeen_mini_project/features/admin/data/admin_data.dart';
import 'package:tamkeen_mini_project/features/admin/presentation/widgets/admin_header.dart';
import 'package:tamkeen_mini_project/features/admin/presentation/widgets/scan_button.dart';
import 'package:tamkeen_mini_project/features/admin/presentation/widgets/search_field.dart';
import 'package:tamkeen_mini_project/features/admin/presentation/widgets/user_bean_card.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0).r,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 50).r,
                child: const AdminHeader(greetingName: 'ZIAD', points: 250),
              ),
              SizedBox(height: 46.h),
              const SearchField(),
              SizedBox(height: 16.h),
              Expanded(
                child: ListView.separated(
                  itemCount: users.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 14),
                  itemBuilder: (context, index) {
                    final user = users[index];
                    return UserBeanCard(user: user);
                  },
                ),
              ),
              const SizedBox(height: 12),
              ScanQrButton(onTap: () {}),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}
