import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BannerWireframe extends StatelessWidget {
  const BannerWireframe({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: EdgeInsets.all(18).r,
        child: Row(
          children: [
            PromoBannerItemSkeleton(),
            SizedBox(width: 20.w),
            PromoBannerItemSkeleton(),
          ],
        ),
      ),
    );
  }
}

class PromoBannerItemSkeleton extends StatefulWidget {
  const PromoBannerItemSkeleton({super.key});

  @override
  State<PromoBannerItemSkeleton> createState() =>
      _PromoBannerItemSkeletonState();
}

class _PromoBannerItemSkeletonState extends State<PromoBannerItemSkeleton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1400),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20).r,
      child: Container(
        width: 286.w,
        height: 170.h,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.white10, Colors.white10],
          ),
        ),
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.all(18).r,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _bar(width: 70.w, height: 14.h),
                  SizedBox(height: 10.h),
                  _bar(width: 60.w, height: 14.h),
                  SizedBox(height: 10),
                  _bar(width: 80.w, height: 14.h),
                ],
              ),
            ),
            Positioned.fill(
              child: AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return ShaderMask(
                    blendMode: BlendMode.srcATop,
                    shaderCallback: (rect) {
                      final double slide = _controller.value;
                      return LinearGradient(
                        begin: Alignment(-1.5 + 3.0 * slide, -0.3),
                        end: Alignment(-0.5 + 3.0 * slide, 0.3),
                        colors: [
                          Colors.transparent,
                          Color(0x33FFFFFF),
                          Color(0x66FFFFFF),
                          Color(0x33FFFFFF),
                          Colors.transparent,
                        ],
                        stops: [0.0, 0.35, 0.5, 0.65, 1.0],
                      ).createShader(rect);
                    },
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                      child: Container(
                        color: Color(0x1AFFFFFF),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _bar({required double width, required double height}) {
    return Container(
      width: width.w,
      height: height.h,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.18),
        borderRadius: BorderRadius.circular(6),
      ),
    );
  }
}
