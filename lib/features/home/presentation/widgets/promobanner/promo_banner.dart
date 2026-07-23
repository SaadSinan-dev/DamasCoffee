import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tamkeen_mini_project/Localization/l10n/app_localizations.dart';
import 'package:tamkeen_mini_project/core/theme/color/app_colors.dart';
import 'package:tamkeen_mini_project/features/home/data/banner_data.dart';

class PromoBanner extends StatelessWidget {
  const PromoBanner({super.key, required banners});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 6, vertical: 16).r,
        child: Row(
          children: List.generate(
            promoBanners.length,
            (index) => Padding(
              padding: EdgeInsets.only(
                right: index == promoBanners.length - 1 ? 0 : 20,
                left: index == promoBanners.length - 1 ? 0 : 20,
              ),
              child: PromoBannerItem(
                banner: promoBanners[index],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class PromoBannerItem extends StatelessWidget {
  final PromoBannerData banner;

  const PromoBannerItem({
    super.key,
    required this.banner,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Stack(
      alignment: AlignmentDirectional.centerEnd,
      children: [
        Container(
          width: 270.w,
          height: 160.h,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.background, width: 0.8),
            borderRadius: BorderRadius.circular(20).r,
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(banner.image),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(18).r,
          child: Text(
            l10n.buy2Get1Free,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
