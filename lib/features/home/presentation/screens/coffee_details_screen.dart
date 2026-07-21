import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tamkeen_mini_project/core/theme/color/app_colors.dart';
import 'package:tamkeen_mini_project/features/home/data/coffee_data.dart';
import 'package:tamkeen_mini_project/features/home/presentation/widgets/filter/size_filter.dart';

class CoffeeDetailsScreen extends StatefulWidget {
  final CoffeeProduct coffee;
  const CoffeeDetailsScreen({super.key, required this.coffee});

  @override
  State<CoffeeDetailsScreen> createState() => _CoffeeDetailsScreenState();
}

class _CoffeeDetailsScreenState extends State<CoffeeDetailsScreen> {
  bool _isFavorite = false;

  CoffeeProduct get _coffee => widget.coffee;

  @override
  Widget build(BuildContext context) {
    final imageHeight = MediaQuery.of(context).size.height * 0.68;

    return Scaffold(
      backgroundColor: const Color(0xFF0C0F14),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _HeroImage(
              coffee: _coffee,
              imageHeight: imageHeight,
              isFavorite: _isFavorite,
              onFavoriteTap: () => setState(() => _isFavorite = !_isFavorite),
            ),
            _DetailsSection(coffee: _coffee),
          ],
        ),
      ),
    );
  }
}

class _HeroImage extends StatelessWidget {
  final CoffeeProduct coffee;
  final double imageHeight;
  final bool isFavorite;
  final VoidCallback onFavoriteTap;

  const _HeroImage({
    required this.coffee,
    required this.imageHeight,
    required this.isFavorite,
    required this.onFavoriteTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: imageHeight,
      child: Stack(
        children: [
          _BackgroundImage(imagePath: coffee.imagePath, height: imageHeight),
          Positioned(
            top: 50.h,
            left: 16.w,
            right: 16.w,
            child:
                _TopBar(isFavorite: isFavorite, onFavoriteTap: onFavoriteTap),
          ),
          Positioned(
            bottom: 0.h,
            left: 0.w,
            right: 0.w,
            child: _BlurredInfoCard(coffee: coffee),
          ),
        ],
      ),
    );
  }
}

class _BackgroundImage extends StatelessWidget {
  final String imagePath;
  final double height;

  const _BackgroundImage({required this.imagePath, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _TopBar extends StatelessWidget {
  final bool isFavorite;
  final VoidCallback onFavoriteTap;

  const _TopBar({required this.isFavorite, required this.onFavoriteTap});

  static const _gradient = LinearGradient(colors: [
    Color.fromRGBO(33, 38, 46, 1),
    Color.fromRGBO(12, 15, 20, 1),
  ]);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _CircleIconButton(
          gradient: _gradient,
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 20.r),
        ),
        _CircleIconButton(
          gradient: _gradient,
          onPressed: onFavoriteTap,
          icon: Icon(
            isFavorite ? Icons.favorite : Icons.favorite_border,
            color: isFavorite ? Colors.red : Colors.grey,
            size: 24.r,
          ),
        ),
      ],
    );
  }
}

class _CircleIconButton extends StatelessWidget {
  final LinearGradient gradient;
  final VoidCallback onPressed;
  final Icon icon;

  const _CircleIconButton({
    required this.gradient,
    required this.onPressed,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(10),
      ),
      child: IconButton(onPressed: onPressed, icon: icon),
    );
  }
}

class _BlurredInfoCard extends StatelessWidget {
  final CoffeeProduct coffee;
  const _BlurredInfoCard({required this.coffee});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(25).r,
        topRight: Radius.circular(25).r,
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          padding: EdgeInsets.all(20).r,
          color: Colors.black.withOpacity(0.4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _CoffeeInfo(coffee: coffee),
              _CoffeeBadges(roastLevel: coffee.roastLevel),
            ],
          ),
        ),
      ),
    );
  }
}

class _CoffeeInfo extends StatelessWidget {
  final CoffeeProduct coffee;
  const _CoffeeInfo({required this.coffee});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          coffee.name,
          style: TextStyle(
            color: Colors.white,
            fontSize: 22.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          coffee.from,
          style: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 12),
        ),
        SizedBox(height: 22.h),
        Row(
          children: [
            Icon(Icons.star, color: AppColors.textPrimary, size: 24.r),
            SizedBox(width: 4.w),
            Text(
              coffee.rate,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16.sp,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _CoffeeBadges extends StatelessWidget {
  final String roastLevel;
  const _CoffeeBadges({required this.roastLevel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            _IconBadge(icon: Icons.coffee_sharp),
            SizedBox(width: 12.w),
            _IconBadge(icon: Icons.location_on),
          ],
        ),
        SizedBox(height: 12.h),
        _LabelBadge(label: roastLevel),
      ],
    );
  }
}

class _IconBadge extends StatelessWidget {
  final IconData icon;
  const _IconBadge({required this.icon});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 55.w,
          height: 55.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10).r,
            color: Colors.grey[900],
          ),
        ),
        Icon(icon, color: AppColors.textPrimary),
      ],
    );
  }
}

class _LabelBadge extends StatelessWidget {
  final String label;
  const _LabelBadge({required this.label});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 130.w,
          height: 50.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10).r,
            color: Colors.grey[900],
          ),
        ),
        Text(
          label,
          style: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 12),
        ),
      ],
    );
  }
}

class _DetailsSection extends StatelessWidget {
  final CoffeeProduct coffee;
  const _DetailsSection({required this.coffee});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(24).r,
      color: AppColors.primary,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _SectionLabel(title: 'Description'),
          SizedBox(height: 12.h),
          Text(
            coffee.description,
            style: TextStyle(
              color: Colors.white.withOpacity(0.8),
              fontSize: 14.sp,
              height: 1.5,
            ),
          ),
          SizedBox(height: 18.h),
          _SectionLabel(title: 'Size'),
          SizedBox(height: 16.h),
          SizeFilter(),
          SizedBox(height: 24.h),
          _PriceAndCart(coffee: coffee),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}

class _SectionLabel extends StatelessWidget {
  final String title;
  const _SectionLabel({required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}

class _PriceAndCart extends StatelessWidget {
  final CoffeeProduct coffee;
  const _PriceAndCart({required this.coffee});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Price',
              style: TextStyle(color: Colors.white70, fontSize: 16.sp),
            ),
            Row(
              children: [
                Text(
                  '\$',
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 22.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 8.w),
                Text(
                  coffee.price.toStringAsFixed(2),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            fixedSize: Size(170.w, 50.h),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20).r,
            ),
            foregroundColor: AppColors.secondary,
            backgroundColor: AppColors.textPrimary,
          ),
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Row(
                  children: [
                    Icon(Icons.shopping_cart, color: AppColors.primary),
                    SizedBox(width: 8.w),
                    Text(
                      "Added to Cart!",
                      style: TextStyle(color: AppColors.primary),
                    ),
                  ],
                ),
                backgroundColor: AppColors.textPrimary,
                duration: const Duration(seconds: 2),
                behavior: SnackBarBehavior.floating,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            );
          },
          child: Text(
            "Add to Cart",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16.sp,
              color: AppColors.secondary,
            ),
          ),
        ),
      ],
    );
  }
}
