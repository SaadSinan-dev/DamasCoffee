import 'package:flutter/material.dart';
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
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Row(
        children: coffees
            .map(
              (coffee) => Padding(
                padding: const EdgeInsets.only(right: 18),
                child: CoffeeCard(coffee: coffee),
              ),
            )
            .toList(),
      ),
    );
  }
}
