import 'dart:ui';

import 'package:flutter/material.dart';

/// Skeleton / wireframe placeholder for [BeansList].
/// Shows a horizontal row of shimmering [BeanCardSkeleton]s.
class CoffeWireframe extends StatelessWidget {
  final int itemCount;
  const CoffeWireframe({super.key, this.itemCount = 4});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Row(
        children: List.generate(
          itemCount,
          (index) => Padding(
            padding: const EdgeInsets.only(right: 18),
            child: const BeanCardSkeleton(),
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
      borderRadius: BorderRadius.circular(23),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            width: 150,
            height: 250,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(23),
              color: Colors.white.withOpacity(0.07),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.all(12),
                width: 130,
                height: 130,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.white.withOpacity(0.10),
                ),
              ),
              // Name placeholder.
              Padding(
                padding: const EdgeInsets.only(left: 14),
                child: _bar(width: 90, height: 12),
              ),
              const SizedBox(height: 6),
              // Roast level placeholder.
              Padding(
                padding: const EdgeInsets.only(left: 14),
                child: _bar(width: 60, height: 9),
              ),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _bar(width: 45, height: 14),
                    SizedBox(
                      width: 40,
                    ),
                    Container(
                      width: 30,
                      height: 30,
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
