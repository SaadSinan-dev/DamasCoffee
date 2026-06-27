import 'package:flutter/material.dart';
import 'package:tamkeen_mini_project/core/color/app_colors.dart';
import 'package:tamkeen_mini_project/features/cart/presentation/screens/cart_screen.dart';
import 'package:tamkeen_mini_project/features/cobon/presentation/screens/coupon_screen.dart';
import 'package:tamkeen_mini_project/features/home/presentation/widgets/body/home_body.dart';
import 'package:tamkeen_mini_project/features/profile/presentation/screens/profile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;

  final List<Widget> pages = const [
    HomeBody(),
    CartScreen(),
    ProfileScreen(),
    CouponScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: AppColors.textPrimary,
        unselectedItemColor: Colors.grey,
        backgroundColor: const Color.fromARGB(255, 7, 39, 36),
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(
                Icons.home,
              )),
          BottomNavigationBarItem(
              label: 'Cart',
              icon: Icon(
                Icons.shopping_bag,
              )),
          BottomNavigationBarItem(
              label: 'Favorite',
              icon: Icon(
                Icons.person,
              )),
          BottomNavigationBarItem(
              label: 'Cobon',
              icon: Icon(
                Icons.discount_rounded,
              )),
        ],
      ),
    );
  }
}
