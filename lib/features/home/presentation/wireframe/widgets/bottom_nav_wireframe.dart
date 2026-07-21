import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tamkeen_mini_project/core/theme/color/app_colors.dart';

class BottomNavBarWireframe extends StatefulWidget {
  final int itemCount;
  const BottomNavBarWireframe({super.key, this.itemCount = 4});

  @override
  State<BottomNavBarWireframe> createState() => _BottomNavBarWireframeState();
}

class _BottomNavBarWireframeState extends State<BottomNavBarWireframe>
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
    return Stack(
      children: [
        Container(
          height: 80.h,
          padding: EdgeInsets.symmetric(horizontal: 24).r,
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(24).h,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(
              widget.itemCount,
              (index) => _item(),
            ),
          ),
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
    );
  }

  Widget _item() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 28.w,
          height: 28.h,
          decoration: BoxDecoration(
            color: Colors.white12,
            shape: BoxShape.circle,
          ),
        ),
        SizedBox(height: 8.h),
        Container(
          width: 35.w,
          height: 6.h,
          decoration: BoxDecoration(
            color: Colors.white12,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ],
    );
  }
}
