import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tamkeen_mini_project/features/home/data/coffee_data.dart';
import 'package:tamkeen_mini_project/features/home/presentation/widgets/coffecard/coffee_card.dart';

class CoffeeList extends StatelessWidget {
  const CoffeeList({
    super.key,
    required this.coffees,
  });

  final List<CoffeeProduct> coffees;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.symmetric(horizontal: 18).r,
      child: Row(
        children: coffees
            .map(
              (coffee) => Padding(
                padding: EdgeInsets.only(right: 18).r,
                child: CoffeeCard(coffee: coffee),
              ),
            )
            .toList(),
      ),
    );
  }
}
