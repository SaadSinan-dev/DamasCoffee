import 'package:flutter/material.dart';

class PromoBanner extends StatelessWidget {
  const PromoBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Row(
          children: const [
            PromoBannerItem(),
            SizedBox(width: 20),
            PromoBannerItem(),
          ],
        ),
      ),
    );
  }
}

class PromoBannerItem extends StatelessWidget {
  const PromoBannerItem({super.key});

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
            image: const DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage('assets/images/row1.png'),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(18),
          child: Text(
            "Buy 2 \n Get 1 \n Free",
            style: TextStyle(
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
