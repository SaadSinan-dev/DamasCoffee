import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tamkeen_mini_project/features/home/data/beans_data.dart';
import 'package:tamkeen_mini_project/features/home/presentation/widgets/beancard/bean_card.dart';

class BeansList extends StatelessWidget {
  const BeansList({super.key, required beans});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.symmetric(horizontal: 18).r,
      child: Row(
        children: beans
            .map((bean) => Padding(
                  padding: EdgeInsets.only(right: 18).r,
                  child: BeanCard(bean: bean),
                ))
            .toList(),
      ),
    );
  }
}
