import 'package:tamkeen_mini_project/features/home/data/banner_data.dart';
import 'package:tamkeen_mini_project/features/home/data/beans_data.dart';
import 'package:tamkeen_mini_project/features/home/data/coffee_data.dart';

abstract class HomeRepository {
  Future<List<PromoBannerData>> getBanners();

  Future<List<BeanProduct>> getBeans();

  Future<List<CoffeeProduct>> getCoffees();
}
