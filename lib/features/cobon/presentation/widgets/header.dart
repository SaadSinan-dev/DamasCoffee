import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CouponHeader extends StatelessWidget {
  const CouponHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Best Coffee For You',
      style: TextStyle(
        color: Colors.white,
        fontSize: 22.sp,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
