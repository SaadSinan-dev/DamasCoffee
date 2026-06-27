import 'package:flutter/material.dart';

class HeaderIcon extends StatelessWidget {
  final Widget child;

  const HeaderIcon({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black26),
        gradient: const LinearGradient(
          colors: [
            Color.fromRGBO(33, 38, 46, 1),
            Color.fromRGBO(33, 38, 46, 0),
          ],
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }
}
