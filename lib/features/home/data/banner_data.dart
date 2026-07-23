class PromoBannerData {
  final String image;
  final String titleKey;

  const PromoBannerData({
    required this.image,
    required this.titleKey,
  });
}

const List<PromoBannerData> promoBanners = [
  PromoBannerData(
    image: 'assets/images/row1.png',
    titleKey: 'buy2Get1Free',
  ),
  PromoBannerData(
    image: 'assets/images/coffee222.jpg',
    titleKey: 'buy2Get1Free',
  ),
];
