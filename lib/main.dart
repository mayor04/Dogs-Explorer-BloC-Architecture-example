import 'package:dog_app/core/constant/strings.dart';
import 'package:dog_app/data_layer/local_data_source/local_breed_list.dart';
import 'package:dog_app/data_layer/remote_api/base_api.dart';
import 'package:dog_app/data_layer/remote_api/details_scapper.dart';
import 'package:dog_app/data_layer/remote_api/dog_api.dart';
import 'package:dog_app/features/bloc/details_bloc/breed_details_bloc.dart';
import 'package:dog_app/features/bloc/explore_list_bloc/explore_list_bloc.dart';
import 'package:dog_app/features/repository/breed_repo.dart';
import 'package:dog_app/features/view/intro_view.dart';
import 'package:dog_app/services/navigation_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'config/routes.dart';
import 'config/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final breedRepo = BreedRepository(
      localBreedList: LocalBreedList(),
      dogApi: DogApi(ApiHandler()),
      detailsScraper: DetailsScraper(),
    );

    return MultiBlocProvider(
      providers: [
        BlocProvider<ExploreListBloc>(
          create: (_) => ExploreListBloc(breedRepo)..add(ExploreListInitial()),
        ),
        BlocProvider<BreedDetailsBloc>(
          create: (_) => BreedDetailsBloc(breedRepo),
        ),
      ],
      child: MaterialApp(
        title: AppStrings.appName,
        theme: AppTheme.lightTheme,
        debugShowCheckedModeBanner: false,
        darkTheme: AppTheme.darkTheme,
        home: const IntroView(),
        navigatorKey: NavigationService().navigatorKey,
        onGenerateRoute: AppRoutes.generateRoutes,
      ),
    );
  }
}
