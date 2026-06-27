class BeanProduct {
  final String name;
  final String roastLevel;
  final double price;
  final String imagePath;
  final String rate;
  final String from;
  final String description;

  const BeanProduct({
    required this.name,
    required this.roastLevel,
    required this.price,
    required this.imagePath,
    required this.rate,
    required this.description,
    required this.from,
  });

  String get formattedPrice => '\$${price.toStringAsFixed(2)}';
}

final List<String> weights = ['250 mg', '500 mg', '1000 mg'];
const List<BeanProduct> beans = [
  BeanProduct(
    name: 'Robusta Beans',
    roastLevel: 'Medium Roasted',
    price: 4.20,
    imagePath: 'assets/images/beans-product.png',
    rate: '4.8',
    from: "From Asia",
    description:
        'Robusta beans are known for their strong, bold flavor with a slightly bitter taste. Grown at lower altitudes, they contain more caffeine than Arabica and produce a rich crema, making them ideal for espresso blends.',
  ),
  BeanProduct(
    name: 'Arabica Beans',
    roastLevel: 'Light Roasted',
    price: 5.50,
    from: "From Africa",
    imagePath: 'assets/images/beans-product.png',
    rate: '4.6',
    description:
        'Arabica beans are the most popular coffee beans in the world. They offer a smooth, mild flavor with subtle sweetness and fruity notes. Grown at high altitudes, they are prized for their complex aroma and low bitterness.',
  ),
  BeanProduct(
    name: 'Liberica Beans',
    roastLevel: 'Dark Roasted',
    price: 6.00,
    imagePath: 'assets/images/beans-product.png',
    from: "From Middel East",
    rate: '4.4',
    description:
        'Liberica beans are rare and unique, offering a full-bodied flavor with a distinctive smoky and woody aroma. Their irregular shape and bold taste make them a favorite among coffee enthusiasts looking for something different.',
  ),
];
