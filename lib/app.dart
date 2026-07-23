import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tamkeen_mini_project/Localization/l10n/app_localizations.dart';
import 'package:tamkeen_mini_project/core/localization/cubit/locale_cubit.dart';
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
        BlocProvider<LocaleCubit>(
          create: (_) => LocaleCubit(),
        ),
        BlocProvider<HomeBloc>(
          create: (_) => HomeBloc(
            getBannersUseCase: GetBannersUseCase(repository),
            getBeansUseCase: GetBeansUseCase(repository),
            getCoffeesUseCase: GetCoffeesUseCase(repository),
          )..add(const LoadHomeEvent()),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return BlocBuilder<LocaleCubit, Locale>(
            builder: (context, locale) {
              return MaterialApp(
                theme: ThemeData(
                  fontFamily: locale.languageCode == 'ar' ? 'ElMessiri' : 'IBM',
                ),
                debugShowCheckedModeBanner: false,
                initialRoute: AppRoutes.splash1,
                onGenerateRoute: AppRoutes.onGenerateRoute,
                locale: locale,
                supportedLocales: AppLocalizations.supportedLocales,
                localizationsDelegates: AppLocalizations.localizationsDelegates,
              );
            },
          );
        },
      ),
    );
  }
}
