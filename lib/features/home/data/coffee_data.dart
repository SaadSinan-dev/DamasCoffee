class CoffeeProduct {
  final String name;
  final String roastLevel;
  final double price;
  final String imagePath;
  final String rate;
  final String from;
  final String description;

  const CoffeeProduct({
    required this.name,
    required this.rate,
    required this.roastLevel,
    required this.price,
    required this.imagePath,
    required this.from,
    required this.description,
  });

  String get formattedPrice => '\$${price.toStringAsFixed(2)}';
}

const List<CoffeeProduct> coffees = [
  CoffeeProduct(
    name: 'Cappuccino',
    roastLevel: 'Medium Roasted',
    price: 4.50,
    imagePath: 'assets/images/cappuccino1.png',
    rate: '4.5',
    from: 'Italy',
    description:
        'A classic Italian coffee drink made with equal parts espresso, steamed milk, and milk foam. Rich and creamy with a bold espresso base, perfect for a morning boost.',
  ),
  CoffeeProduct(
    name: 'Latte',
    roastLevel: 'Light Roasted',
    price: 3.99,
    imagePath: 'assets/images/cappuccino2.png',
    rate: '4.2',
    from: 'France',
    description:
        'A smooth and mild coffee drink made with espresso and a generous amount of steamed milk. Its creamy texture and subtle flavor make it a favorite for coffee lovers worldwide.',
  ),
  CoffeeProduct(
    name: 'Espresso',
    roastLevel: 'Dark Roasted',
    price: 2.99,
    imagePath: 'assets/images/cappuccino1.png',
    rate: '4.1',
    from: 'Italy',
    description:
        'A concentrated form of coffee brewed by forcing hot water through finely ground coffee beans. Bold, intense, and full-bodied with a rich crema on top.',
  ),
];
