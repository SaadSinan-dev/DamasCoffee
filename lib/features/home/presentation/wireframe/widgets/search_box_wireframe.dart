import 'dart:ui';

import 'package:flutter/material.dart';

class AppSearchBarWireframe extends StatefulWidget {
  const AppSearchBarWireframe({super.key});

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
      padding: const EdgeInsets.fromLTRB(30, 20, 30, 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          children: [
            Container(
              height: 52,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white12,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  // Search icon placeholder.
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.20),
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 12),
                  // Hint-text placeholder.
                  _bar(width: 140, height: 12),
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
    );
  }

  Widget _bar({required double width, required double height}) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.14),
        borderRadius: BorderRadius.circular(6),
      ),
    );
  }
}
