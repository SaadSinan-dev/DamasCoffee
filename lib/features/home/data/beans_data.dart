class BeanProduct {
  final String nameKey;
  final String roastLevelKey;
  final double price;
  final String imagePath;
  final String rate;
  final String fromKey;
  final String descriptionKey;

  const BeanProduct({
    required this.nameKey,
    required this.roastLevelKey,
    required this.price,
    required this.imagePath,
    required this.rate,
    required this.fromKey,
    required this.descriptionKey,
  });

  String get formattedPrice => '\$${price.toStringAsFixed(2)}';
}

const List<String> weights = [
  '250 g',
  '500 g',
  '1000 g',
];

const List<BeanProduct> beans = [
  BeanProduct(
    nameKey: 'robustaBeans',
    roastLevelKey: 'mediumRoasted',
    price: 4.20,
    imagePath: 'assets/images/beans-product.png',
    rate: '4.8',
    fromKey: 'fromAsia',
    descriptionKey: 'robustaDescription',
  ),
  BeanProduct(
    nameKey: 'arabicaBeans',
    roastLevelKey: 'lightRoasted',
    price: 5.50,
    imagePath: 'assets/images/beans-product.png',
    rate: '4.6',
    fromKey: 'fromAfrica',
    descriptionKey: 'arabicaDescription',
  ),
  BeanProduct(
    nameKey: 'libericaBeans',
    roastLevelKey: 'darkRoasted',
    price: 6.00,
    imagePath: 'assets/images/beans-product.png',
    rate: '4.4',
    fromKey: 'fromMiddleEast',
    descriptionKey: 'libericaDescription',
  ),
];
