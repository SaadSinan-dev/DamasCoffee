class CoffeeProduct {
  final String nameKey;
  final String roastLevelKey;
  final double price;
  final String imagePath;
  final String rate;
  final String fromKey;
  final String descriptionKey;

  const CoffeeProduct({
    required this.nameKey,
    required this.rate,
    required this.roastLevelKey,
    required this.price,
    required this.imagePath,
    required this.fromKey,
    required this.descriptionKey,
  });

  String get formattedPrice => '\$${price.toStringAsFixed(2)}';
}

const List<CoffeeProduct> coffees = [
  CoffeeProduct(
    nameKey: 'cappuccino',
    roastLevelKey: 'mediumRoasted',
    price: 4.50,
    imagePath: 'assets/images/cappuccino1.png',
    rate: '4.5',
    fromKey: 'italy',
    descriptionKey: 'cappuccinoDescription',
  ),
  CoffeeProduct(
    nameKey: 'latte',
    roastLevelKey: 'lightRoasted',
    price: 3.99,
    imagePath: 'assets/images/cappuccino2.png',
    rate: '4.2',
    fromKey: 'france',
    descriptionKey: 'latteDescription',
  ),
  CoffeeProduct(
    nameKey: 'espresso',
    roastLevelKey: 'darkRoasted',
    price: 2.99,
    imagePath: 'assets/images/cappuccino1.png',
    rate: '4.1',
    fromKey: 'italy',
    descriptionKey: 'espressoDescription',
  ),
];
