import 'package:tamkeen_mini_project/features/home/data/banner_data.dart';
import 'package:tamkeen_mini_project/features/home/data/repositories/home_repositories.dart';

class GetBannersUseCase {
  final HomeRepository repository;

  const GetBannersUseCase(this.repository);

  Future<List<PromoBannerData>> call() async {
    return await repository.getBanners();
  }
}
