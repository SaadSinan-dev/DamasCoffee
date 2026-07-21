import 'package:tamkeen_mini_project/features/home/data/coffee_data.dart';
import 'package:tamkeen_mini_project/features/home/data/repositories/home_repositories.dart';

class GetCoffeesUseCase {
  final HomeRepository repository;

  const GetCoffeesUseCase(this.repository);

  Future<List<CoffeeProduct>> call() async {
    return await repository.getCoffees();
  }
}
