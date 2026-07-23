import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tamkeen_mini_project/core/enums/request_status.dart';
import 'package:tamkeen_mini_project/core/widgets/bottomnav/app_bottom_nav_bar.dart';
import 'package:tamkeen_mini_project/features/cart/presentation/screens/cart_screen.dart';
import 'package:tamkeen_mini_project/features/cobon/presentation/screens/coupon_screen.dart';
import 'package:tamkeen_mini_project/features/home/presentation/logic/bloc/home_bloc.dart';
import 'package:tamkeen_mini_project/features/home/presentation/logic/bloc/home_event.dart';
import 'package:tamkeen_mini_project/features/home/presentation/logic/bloc/home_state.dart';
import 'package:tamkeen_mini_project/features/home/presentation/widgets/body/home_body.dart';
import 'package:tamkeen_mini_project/features/home/presentation/wireframe/home_screen_wire_frame.dart';
import 'package:tamkeen_mini_project/features/profile/presentation/screens/profile_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  final List<Widget> pages = const [
    HomeBody(),
    CartScreen(),
    ProfileScreen(),
    CouponScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state.status == RequestStatus.loading) {
          return const Scaffold(
            body: HomeWireframe(),
          );
        }

        if (state.status == RequestStatus.failure) {
          return Scaffold(
            body: Center(
              child: Text(state.errorMessage ?? ''),
            ),
          );
        }

        return Scaffold(
          body: pages[state.currentIndex],
          bottomNavigationBar: AppBottomNavBar(
            currentIndex: state.currentIndex,
            onTap: (index) {
              context.read<HomeBloc>().add(
                    ChangeBottomNavEvent(index),
                  );
            },
          ),
        );
      },
    );
  }
}
