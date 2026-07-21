import 'package:tamkeen_mini_project/features/home/data/beans_data.dart';
import 'package:tamkeen_mini_project/features/home/data/repositories/home_repositories.dart';

class GetBeansUseCase {
  final HomeRepository repository;

  const GetBeansUseCase(this.repository);

  Future<List<BeanProduct>> call() async {
    return await repository.getBeans();
  }
}
