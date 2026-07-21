import 'package:flutter/material.dart';
import 'package:tamkeen_mini_project/core/theme/color/app_colors.dart';
import 'package:tamkeen_mini_project/features/home/presentation/wireframe/widgets/banner_wireframe.dart';
import 'package:tamkeen_mini_project/features/home/presentation/wireframe/widgets/bean_wireframe.dart';
import 'package:tamkeen_mini_project/features/home/presentation/wireframe/widgets/bottom_nav_wireframe.dart';
import 'package:tamkeen_mini_project/features/home/presentation/wireframe/widgets/coffe_wireframe.dart';
import 'package:tamkeen_mini_project/features/home/presentation/wireframe/widgets/header_wireframe.dart';
import 'package:tamkeen_mini_project/features/home/presentation/wireframe/widgets/search_box_wireframe.dart';
import 'package:tamkeen_mini_project/features/home/presentation/wireframe/widgets/section_label_wireframe.dart';

/// The screen itself — just lays the sections out in a scrollable
/// column. No controllers, no setState, no business logic here: each
/// section (HeaderSection, PromoBannerSection, CoffeeListSection,
/// BeansListSection) already owns its own loading flag and swaps
/// itself from skeleton to real content independently. This screen
/// doesn't know or care which sections are still loading.
class HomeWireframe extends StatelessWidget {
  const HomeWireframe({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeHeaderWireframe(),
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(4, 0, 4, 20),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppSearchBarWireframe(),
              SizedBox(height: 20),
              BannerWireframe(),
              SectionLabelHomeWireframe(
                title: 'Coffee beans',
              ),
              CoffeWireframe(),
              SizedBox(height: 28),
              SectionLabelHomeWireframe(
                title: 'Cappuccino',
              ),
              BeanWireframe(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBarWireframe(),
    );
  }
}
