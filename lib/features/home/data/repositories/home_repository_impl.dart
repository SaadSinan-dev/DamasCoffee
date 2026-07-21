import 'package:tamkeen_mini_project/features/home/data/repositories/home_repositories.dart';

import '../banner_data.dart';
import '../beans_data.dart';
import '../coffee_data.dart';

class HomeRepositoryImpl implements HomeRepository {
  @override
  Future<List<PromoBannerData>> getBanners() async {
    return promoBanners;
  }

  @override
  Future<List<BeanProduct>> getBeans() async {
    return beans;
  }

  @override
  Future<List<CoffeeProduct>> getCoffees() async {
    return coffees;
  }
}
