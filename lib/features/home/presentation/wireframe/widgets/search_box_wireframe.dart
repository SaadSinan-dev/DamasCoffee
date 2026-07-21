import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppSearchBarWireframe extends StatefulWidget {
  AppSearchBarWireframe({super.key});

  @override
  State<AppSearchBarWireframe> createState() => _AppSearchBarWireframeState();
}

class _AppSearchBarWireframeState extends State<AppSearchBarWireframe>
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
      padding: EdgeInsets.fromLTRB(30, 20, 30, 10).r,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15).r,
        child: Stack(
          children: [
            Container(
              height: 52.h,
              width: double.infinity.w,
              padding: EdgeInsets.symmetric(horizontal: 16).r,
              decoration: BoxDecoration(
                color: Colors.white12,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  Container(
                    width: 20.w,
                    height: 20.h,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.20),
                      shape: BoxShape.circle,
                    ),
                  ),
                  SizedBox(width: 12.w),
                  // Hint-text placeholder.
                  _bar(width: 140, height: 12),
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
        color: Colors.white.withOpacity(0.14),
        borderRadius: BorderRadius.circular(6),
      ),
    );
  }
}
