class CartItemModel {
  final String name;
  final String imagePath;
  final String roastLevel;
  final double size;
  final double price;
  int quantity;

  CartItemModel({
    required this.name,
    required this.imagePath,
    required this.roastLevel,
    required this.size,
    required this.price,
    this.quantity = 1,
  });
}

class CartData {
  CartData._();

  static List<CartItemModel> items = [
    CartItemModel(
      name: 'Ethiopian Yirgacheffe',
      imagePath: 'assets/images/cappuccino1.png',
      roastLevel: 'Light',
      size: 250,
      price: 12.99,
      quantity: 1,
    ),
    CartItemModel(
      name: 'Colombian Supremo',
      imagePath: 'assets/images/beans-product.png',
      roastLevel: 'Medium',
      size: 500,
      price: 18.49,
      quantity: 2,
    ),
    CartItemModel(
      name: 'Sumatra Mandheling',
      imagePath: 'assets/images/cappuccino2.png',
      roastLevel: 'Dark',
      size: 250,
      price: 14.99,
      quantity: 1,
    ),
  ];
}
