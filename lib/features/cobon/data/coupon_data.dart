class CouponModel {
  final String description;
  final String discount;
  final String imagePath;
  final String? badgeImagePath;

  const CouponModel({
    required this.description,
    required this.discount,
    required this.imagePath,
    this.badgeImagePath,
  });
}

class CouponData {
  CouponData._();

  static const List<CouponModel> coupons = [
    CouponModel(
      description: '70% discount for any instant \ncoffee package',
      discount: '70%',
      imagePath: 'assets/images/sachet.png',
      badgeImagePath: 'assets/images/promo1.png',
    ),
    CouponModel(
      description: 'new special Americano ~',
      discount: '30%',
      imagePath: 'assets/images/satus2.png',
    ),
    CouponModel(
      description: '30% discount for any coffee \npackage',
      discount: '30%',
      imagePath: 'assets/images/satus3.png',
    ),
  ];
}
