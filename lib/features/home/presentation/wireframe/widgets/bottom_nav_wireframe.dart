import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:tamkeen_mini_project/core/theme/color/app_colors.dart';

/// Skeleton / wireframe placeholder for the bottom navigation bar.
/// Shows shimmering circle + bar placeholders for each nav item.
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
    return Stack(
      children: [
        Container(
          height: 80,
          padding: const EdgeInsets.symmetric(horizontal: 24),
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(24),
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
    );
  }

  Widget _item() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 28,
          height: 28,
          decoration: BoxDecoration(
            color: Colors.white12,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: 35,
          height: 6,
          decoration: BoxDecoration(
            color: Colors.white12,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ],
    );
  }
}
