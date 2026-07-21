import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tamkeen_mini_project/core/theme/color/app_colors.dart';

class HomeHeaderWireframe extends StatefulWidget
    implements PreferredSizeWidget {
  const HomeHeaderWireframe({super.key});

  static final double _kContentHeight = 16 + 32 + 24;
  static final double _kEstimatedStatusBar = 44;

  @override
  Size get preferredSize =>
      Size.fromHeight(_kContentHeight + _kEstimatedStatusBar);

  @override
  State<HomeHeaderWireframe> createState() => _HomeHeaderWireframeState();
}

class _HomeHeaderWireframeState extends State<HomeHeaderWireframe>
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
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20).r,
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24).r,
          bottomRight: Radius.circular(24).r,
        ),
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: widget.preferredSize.height.h,
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top + 16,
                bottom: 24.h,
                left: 20.w,
                right: 20.w,
              ),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(24).r,
                  bottomRight: Radius.circular(24).r,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Title placeholder.
                  _bar(width: 170.w, height: 20.h),
                  // Points-badge placeholder.
                  Container(
                    width: 70.w,
                    height: 32.h,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.16),
                      borderRadius: BorderRadius.circular(16).r,
                    ),
                  ),
                ],
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
