import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tamkeen_mini_project/core/enums/request_status.dart';
import 'package:tamkeen_mini_project/core/theme/color/app_colors.dart';
import 'package:tamkeen_mini_project/features/home/presentation/logic/bloc/home_bloc.dart';
import 'package:tamkeen_mini_project/features/home/presentation/logic/bloc/home_state.dart';
import 'package:tamkeen_mini_project/features/home/presentation/widgets/beancard/beans_list.dart';
import 'package:tamkeen_mini_project/features/home/presentation/widgets/coffecard/coffee_list.dart';
import 'package:tamkeen_mini_project/features/home/presentation/widgets/filter/filter_chips.dart';
import 'package:tamkeen_mini_project/features/home/presentation/widgets/header/home_header.dart';
import 'package:tamkeen_mini_project/features/home/presentation/widgets/label/section_label.dart';
import 'package:tamkeen_mini_project/features/home/presentation/widgets/promobanner/promo_banner.dart';
import 'package:tamkeen_mini_project/features/home/presentation/widgets/searchbox/search_box.dart';
import 'package:tamkeen_mini_project/features/home/presentation/wireframe/home_screen_wire_frame.dart';

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
      child: SafeArea(child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state.status == RequestStatus.loading) {
            return const HomeWireframe();
          }

          if (state.status == RequestStatus.failure) {
            return Center(
              child: Text(state.errorMessage ?? ''),
            );
          }

          return SingleChildScrollView(
            child: Column(
              children: [
                HomeHeader(),
                AppSearchBar(controller: _searchController),
                FilterChips(
                  selected: _selectedFilter,
                  onSelect: (i) => setState(() => _selectedFilter = i),
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
          );
        },
      )),
    );
  }
}
