import 'dart:ui';

import 'package:flutter/material.dart';

/// Skeleton / wireframe placeholder for [SectionLabelHome].
/// Same alignment/padding as the real label, with a shimmering
/// grey-glass bar standing in for the [title] text.
class SectionLabelHomeWireframe extends StatefulWidget {
  /// Kept to mirror [SectionLabelHome]'s API so this widget can be
  /// swapped in/out as a drop-in replacement. Not shown while loading.
  final String title;

  /// Roughly how wide the placeholder bar should be, to mimic
  /// different title lengths ("Popular", "Recommended for you", ...).
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
        padding: const EdgeInsets.all(20),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: Stack(
            children: [
              Container(
                width: widget.width,
                height: 18,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.14),
                  borderRadius: BorderRadius.circular(6),
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
                            color: const Color(
                                0x14FFFFFF), // subtle grey glass tint
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
