import 'package:tamkeen_mini_project/core/enums/request_status.dart';
import 'package:tamkeen_mini_project/features/home/data/banner_data.dart';
import 'package:tamkeen_mini_project/features/home/data/beans_data.dart';
import 'package:tamkeen_mini_project/features/home/data/coffee_data.dart';
import 'package:tamkeen_mini_project/features/home/data/label_data.dart';

class HomeState {
  final RequestStatus status;

  final List<PromoBannerData> banners;
  final List<BeanProduct> beans;
  final List<CoffeeProduct> coffees;
  final List<HomeSectionLabel> labels;

  final RequestStatus bottomNavStatus;
  final int currentIndex;

  final String? errorMessage;

  const HomeState({
    this.status = RequestStatus.initial,
    this.banners = const [],
    this.beans = const [],
    this.coffees = const [],
    this.labels = const [],
    this.bottomNavStatus = RequestStatus.initial,
    this.currentIndex = 0,
    this.errorMessage,
  });

  HomeState copyWith({
    RequestStatus? status,
    List<PromoBannerData>? banners,
    List<BeanProduct>? beans,
    List<CoffeeProduct>? coffees,
    List<HomeSectionLabel>? labels,
    RequestStatus? bottomNavStatus,
    int? currentIndex,
    String? errorMessage,
  }) {
    return HomeState(
      status: status ?? this.status,
      banners: banners ?? this.banners,
      beans: beans ?? this.beans,
      coffees: coffees ?? this.coffees,
      labels: labels ?? this.labels,
      bottomNavStatus: bottomNavStatus ?? this.bottomNavStatus,
      currentIndex: currentIndex ?? this.currentIndex,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
