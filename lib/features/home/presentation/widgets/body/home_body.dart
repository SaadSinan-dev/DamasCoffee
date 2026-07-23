import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tamkeen_mini_project/Localization/l10n/app_localizations.dart';
import 'package:tamkeen_mini_project/core/theme/color/app_colors.dart';
import 'package:tamkeen_mini_project/features/home/presentation/logic/bloc/home_bloc.dart';
import 'package:tamkeen_mini_project/features/home/presentation/widgets/beancard/beans_list.dart';
import 'package:tamkeen_mini_project/features/home/presentation/widgets/coffecard/coffee_list.dart';
import 'package:tamkeen_mini_project/features/home/presentation/widgets/filter/filter_chips.dart';
import 'package:tamkeen_mini_project/features/home/presentation/widgets/header/home_header.dart';
import 'package:tamkeen_mini_project/features/home/presentation/widgets/label/section_label.dart';
import 'package:tamkeen_mini_project/features/home/presentation/widgets/promobanner/promo_banner.dart';
import 'package:tamkeen_mini_project/features/home/presentation/widgets/searchbox/search_box.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  final TextEditingController _searchController = TextEditingController();

  int _selectedFilter = 0;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  String _getSectionTitle(
    AppLocalizations l10n,
    String key,
  ) {
    switch (key) {
      case 'coffeeBeans':
        return l10n.coffeeBeans;

      case 'cappuccino':
        return l10n.cappuccino;

      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<HomeBloc>().state;
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SingleChildScrollView(
        child: Column(
          children: [
            HomeHeader(),
            AppSearchBar(
              controller: _searchController,
            ),
            FilterChips(
              selected: _selectedFilter,
              onSelect: (index) {
                setState(() {
                  _selectedFilter = index;
                });
              },
            ),
            PromoBanner(
              banners: state.banners,
            ),
            SectionLabelHome(
              title: state.labels.isNotEmpty
                  ? _getSectionTitle(l10n, state.labels[0].titleKey)
                  : '',
            ),
            BeansList(
              beans: state.beans,
            ),
            SizedBox(height: 16.h),
            SectionLabelHome(
              title: state.labels.isNotEmpty
                  ? _getSectionTitle(l10n, state.labels[1].titleKey)
                  : '',
            ),
            CoffeeList(
              coffees: state.coffees,
            ),
          ],
        ),
      ),
    );
  }
}
