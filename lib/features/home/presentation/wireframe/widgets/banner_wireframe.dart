import 'dart:ui';

import 'package:flutter/material.dart';

class BannerWireframe extends StatelessWidget {
  const BannerWireframe({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Row(
          children: const [
            PromoBannerItemSkeleton(),
            SizedBox(width: 20),
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
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: 286,
        height: 170,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.white10, Colors.white10],
          ),
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _bar(width: 70, height: 14),
                  const SizedBox(height: 10),
                  _bar(width: 60, height: 14),
                  const SizedBox(height: 10),
                  _bar(width: 80, height: 14),
                ],
              ),
            ),
            // Animated grey glass shimmer sweep.
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
                        colors: const [
                          Colors.transparent,
                          Color(0x33FFFFFF),
                          Color(0x66FFFFFF),
                          Color(0x33FFFFFF),
                          Colors.transparent,
                        ],
                        stops: const [0.0, 0.35, 0.5, 0.65, 1.0],
                      ).createShader(rect);
                    },
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                      child: Container(
                        color: const Color(0x1AFFFFFF),
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
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.18),
        borderRadius: BorderRadius.circular(6),
      ),
    );
  }
}
