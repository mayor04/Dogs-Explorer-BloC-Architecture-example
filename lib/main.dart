import 'package:dog_app/core/constant/strings.dart';
import 'package:dog_app/data_layer/local_data_source/local_breed_list.dart';
import 'package:dog_app/data_layer/remote_api/base_api.dart';
import 'package:dog_app/data_layer/remote_api/details_scapper.dart';
import 'package:dog_app/data_layer/remote_api/dog_api.dart';
import 'package:dog_app/features/bloc/details_bloc/breed_details_bloc.dart';
import 'package:dog_app/features/bloc/explore_list_bloc/explore_list_bloc.dart';
import 'package:dog_app/features/repository/breed_repo.dart';
import 'package:dog_app/features/view/details_view.dart';
import 'package:dog_app/features/view/explore_view.dart';
import 'package:dog_app/features/view/intro_view.dart';
import 'package:dog_app/services/navigation_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'config/routes.dart';
import 'config/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

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
      child: MaterialApp.router(
        title: AppStrings.appName,
        theme: AppTheme.lightTheme,
        debugShowCheckedModeBanner: false,
        darkTheme: AppTheme.darkTheme,
        routeInformationParser: _router.routeInformationParser,
        routerDelegate: _router.routerDelegate,
      ),
    );
  }

  final _router = GoRouter(
    urlPathStrategy: UrlPathStrategy.path,
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const IntroView(),
      ),
      GoRoute(
        name: 'explore',
        path: '/explore',
        builder: (context, state) {
          return ExploreView(
            key: state.pageKey,
          );
        },
        routes: [
          GoRoute(
            name: 'details',
            path: 'details/:name',
            builder: (context, state) {
              String? name = state.params['name'];
              var breedDataModel =
                  context.read<ExploreListBloc>().state.breedFromName(name);

              return DetailsView(
                key: state.pageKey,
                breedDataModel: breedDataModel!,
              );
            },
          ),
        ],
      ),
    ],
  );
}
