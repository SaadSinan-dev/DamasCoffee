import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SectionLabelHomeWireframe extends StatefulWidget {
  final String title;

  final double width;

  const SectionLabelHomeWireframe({
    super.key,
    required this.title,
    this.width = 130,
  });

  @override
  State<SectionLabelHomeWireframe> createState() =>
      _SectionLabelHomeWireframeState();
}

class _SectionLabelHomeWireframeState extends State<SectionLabelHomeWireframe>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.all(20).r,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(6).r,
          child: Stack(
            children: [
              Container(
                width: widget.width.w,
                height: 18.h,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.14),
                  borderRadius: BorderRadius.circular(6).r,
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
                            colors: const [
                              Colors.transparent,
                              Color(0x2EFFFFFF),
                              Color(0x5CFFFFFF),
                              Color(0x2EFFFFFF),
                              Colors.transparent,
                            ],
                            stops: const [0.0, 0.35, 0.5, 0.65, 1.0],
                          ).createShader(rect);
                        },
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                          child: Container(
                            color: const Color(0x14FFFFFF),
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
      ),
    );
  }
}
