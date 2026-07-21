import 'package:flutter/material.dart';

class SectionLabelHome extends StatelessWidget {
  final String title;
  const SectionLabelHome({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
