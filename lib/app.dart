import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tamkeen_mini_project/core/routing/app_routes.dart';
import 'package:tamkeen_mini_project/features/home/data/repositories/home_repository_impl.dart';
import 'package:tamkeen_mini_project/features/home/domain/usecases/get_banners_usecase.dart';
import 'package:tamkeen_mini_project/features/home/domain/usecases/get_beans_usecase.dart';
import 'package:tamkeen_mini_project/features/home/domain/usecases/get_coffee_usecase.dart';
import 'package:tamkeen_mini_project/features/home/presentation/logic/bloc/home_bloc.dart';
import 'package:tamkeen_mini_project/features/home/presentation/logic/bloc/home_event.dart';

class App extends StatelessWidget {
  App({super.key});

  final repository = HomeRepositoryImpl();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => HomeBloc(
            getBannersUseCase: GetBannersUseCase(repository),
            getBeansUseCase: GetBeansUseCase(repository),
            getCoffeesUseCase: GetCoffeesUseCase(repository),
          )..add(const LoadHomeEvent()),
        ),
      ],
      child: MaterialApp(
        initialRoute: AppRoutes.home,
        routes: AppRoutes.routes,
        locale: const Locale("en"),
        supportedLocales: const [
          Locale("en"),
          Locale("ar"),
        ],
        localizationsDelegates: const [],
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
