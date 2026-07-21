import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tamkeen_mini_project/core/constants/error_messages.dart';
import 'package:tamkeen_mini_project/core/enums/request_status.dart';
import 'package:tamkeen_mini_project/features/home/data/label_data.dart';
import 'package:tamkeen_mini_project/features/home/domain/usecases/get_banners_usecase.dart';
import 'package:tamkeen_mini_project/features/home/domain/usecases/get_beans_usecase.dart';
import 'package:tamkeen_mini_project/features/home/domain/usecases/get_coffee_usecase.dart';

import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetBannersUseCase getBannersUseCase;
  final GetBeansUseCase getBeansUseCase;
  final GetCoffeesUseCase getCoffeesUseCase;

  HomeBloc({
    required this.getBannersUseCase,
    required this.getBeansUseCase,
    required this.getCoffeesUseCase,
  }) : super(const HomeState()) {
    on<LoadHomeEvent>(_onLoadHome);
  }
  Future<void> _onLoadHome(
    LoadHomeEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(
      state.copyWith(
        status: RequestStatus.loading,
      ),
    );

    try {
      await Future.delayed(const Duration(seconds: 10));

      final banners = await getBannersUseCase();
      final beans = await getBeansUseCase();
      final coffees = await getCoffeesUseCase();

      emit(
        state.copyWith(
          status: RequestStatus.success,
          banners: banners,
          beans: beans,
          coffees: coffees,
          labels: homeSectionLabels,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: RequestStatus.failure,
          errorMessage: ErrorMessages.server,
        ),
      );
    }
  }
}
