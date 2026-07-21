class PromoBannerData {
  final String image;
  final String title;

  const PromoBannerData({
    required this.image,
    required this.title,
  });
}

const List<PromoBannerData> promoBanners = [
  PromoBannerData(
    image: 'assets/images/row1.png',
    title: 'Buy 2\nGet 1\nFree',
  ),
  PromoBannerData(
    image: 'assets/images/coffee222.jpg',
    title: 'Buy 2\nGet 1\nFree',
  ),
];
