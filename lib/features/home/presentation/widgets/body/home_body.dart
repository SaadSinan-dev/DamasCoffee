import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

  @override
  Widget build(BuildContext context) {
    final state = context.watch<HomeBloc>().state;

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
              title: state.labels.isNotEmpty ? state.labels[0].title : '',
            ),
            BeansList(
              beans: state.beans,
            ),
            const SizedBox(height: 16),
            SectionLabelHome(
              title: state.labels.length > 1 ? state.labels[1].title : '',
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
