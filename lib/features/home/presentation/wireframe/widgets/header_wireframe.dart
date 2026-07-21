import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:tamkeen_mini_project/core/theme/color/app_colors.dart';

class HomeHeaderWireframe extends StatefulWidget {
  const HomeHeaderWireframe({super.key});

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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top + 16,
                bottom: 24,
                left: 20,
                right: 20,
              ),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Title placeholder.
                  _bar(width: 170, height: 20),
                  // Points-badge placeholder.
                  Container(
                    width: 70,
                    height: 32,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.16),
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ],
              ),
            ),
            // Animated grey glass shimmer sweep.
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
                            Color(0x2EFFFFFF), // faint grey-white glass
                            Color(0x5CFFFFFF), // brighter glass core
                            Color(0x2EFFFFFF),
                            Colors.transparent,
                          ],
                          stops: const [0.0, 0.35, 0.5, 0.65, 1.0],
                        ).createShader(rect);
                      },
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                        child: Container(
                          color:
                              const Color(0x14FFFFFF), // subtle grey glass tint
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
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.18),
        borderRadius: BorderRadius.circular(6),
      ),
    );
  }
}
