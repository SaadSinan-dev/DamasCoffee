import 'package:flutter/material.dart';
import 'package:tamkeen_mini_project/features/home/data/banner_data.dart';

class PromoBanner extends StatelessWidget {
  const PromoBanner({super.key, required banners});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Row(
          children: List.generate(
            promoBanners.length,
            (index) => Padding(
              padding: EdgeInsets.only(
                right: index == promoBanners.length - 1 ? 0 : 20,
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
    return Stack(
      alignment: Alignment.centerRight,
      children: [
        Container(
          width: 286,
          height: 170,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(banner.image),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(18),
          child: Text(
            banner.title,
            style: const TextStyle(
              fontFamily: 'PT Sans',
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
