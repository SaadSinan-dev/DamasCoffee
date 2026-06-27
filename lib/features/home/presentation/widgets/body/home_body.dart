import 'package:flutter/material.dart';
import 'package:tamkeen_mini_project/core/color/app_colors.dart';
import 'package:tamkeen_mini_project/features/home/data/coffee_data.dart';
import 'package:tamkeen_mini_project/features/home/presentation/widgets/beancard/beans_list.dart';
import 'package:tamkeen_mini_project/features/home/presentation/widgets/coffecard/coffee_list.dart';
import 'package:tamkeen_mini_project/features/home/presentation/widgets/filter/filter_chips.dart';
import 'package:tamkeen_mini_project/features/home/presentation/widgets/header/home_header.dart';
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
  int currentIndex = 0;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primary,
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    HomeHeader(),
                    AppSearchBar(controller: _searchController),
                    FilterChips(
                      selected: _selectedFilter,
                      onSelect: (i) => setState(() => _selectedFilter = i),
                    ),
                    PromoBanner(),
                    SectionLabel(title: 'Coffee beans'),
                    BeansList(),
                    SizedBox(height: 16),
                    SectionLabel(title: 'Cappuccino'),
                    CoffeeList(
                      coffees: coffees,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SectionLabel extends StatelessWidget {
  final String title;
  const SectionLabel({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
