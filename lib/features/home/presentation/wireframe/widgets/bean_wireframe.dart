import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BeanWireframe extends StatelessWidget {
  final int itemCount;
  const BeanWireframe({super.key, this.itemCount = 4});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.symmetric(horizontal: 18).r,
      child: Row(
        children: List.generate(
          itemCount,
          (index) => Padding(
            padding: EdgeInsets.only(right: 18).r,
            child: BeanCardSkeleton(),
          ),
        ),
      ),
    );
  }
}

class BeanCardSkeleton extends StatefulWidget {
  const BeanCardSkeleton({super.key});

  @override
  State<BeanCardSkeleton> createState() => _BeanCardSkeletonState();
}

class _BeanCardSkeletonState extends State<BeanCardSkeleton>
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
      borderRadius: BorderRadius.circular(23),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            width: 150.w,
            height: 250.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(23).r,
              color: Colors.white.withOpacity(0.07),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.all(12),
                width: 130.w,
                height: 130.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16).r,
                  color: Colors.white.withOpacity(0.10),
                ),
              ),
              // Name placeholder.
              Padding(
                padding: EdgeInsets.only(left: 14).r,
                child: _bar(width: 90.w, height: 12.h),
              ),
              SizedBox(height: 6.h),

              Padding(
                padding: EdgeInsets.only(left: 14).r,
                child: _bar(width: 60.w, height: 9.h),
              ),
              SizedBox(height: 12.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12).r,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _bar(width: 45.w, height: 14.h),
                    SizedBox(
                      width: 40.w,
                    ),
                    Container(
                      width: 30.w,
                      height: 30.h,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.10),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned.fill(
            child: IgnorePointer(
              child: AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  final double slide = _controller.value;
                  return ShaderMask(
                    blendMode: BlendMode.srcATop,
                    shaderCallback: (rect) {
                      return LinearGradient(
                        begin: Alignment(-1.5 + 3.0 * slide, -0.6),
                        end: Alignment(-0.5 + 3.0 * slide, 0.6),
                        colors: [
                          Colors.transparent,
                          Color(0x2EFFFFFF),
                          Color(0x5CFFFFFF),
                          Color(0x2EFFFFFF),
                          Colors.transparent,
                        ],
                        stops: [0.0, 0.35, 0.5, 0.65, 1.0],
                      ).createShader(rect);
                    },
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                      child: Container(
                        color: Color(0x14FFFFFF),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _bar({required double width, required double height}) {
    return Container(
      width: width.w,
      height: height.h,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.14),
        borderRadius: BorderRadius.circular(6),
      ),
    );
  }
}
