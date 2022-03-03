import 'dart:collection';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dog_app/core/utils/extension.dart';
import 'package:dog_app/data_layer/models/breed_data_model.dart';
import 'package:dog_app/features/repository/breed_repo.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

part 'explore_list_event.dart';
part 'explore_list_state.dart';

class ExploreListBloc extends Bloc<ExploreListEvent, ExploreListState> {
  final BreedRepository breedRepo;

  ExploreListBloc(this.breedRepo) : super(const ExploreListState()) {
    on<ExploreListInitial>(_initialFetch);
    on<ExploreListMore>(_moreFetch);
  }

  Future<void> _initialFetch(
      ExploreListInitial event, Emitter<ExploreListState> emit) async {
    try {
      var breedList = await breedRepo.listOfBreeds();
      emit(ExploreListState(
        status: ExploreListStatus.success,
        breedList: breedList,
      ));
    } catch (e) {
      emit(ExploreListState(
        status: ExploreListStatus.error,
        breedList: state.breedList,
      ));
    }
  }

  Future<void> _moreFetch(
      ExploreListMore event, Emitter<ExploreListState> emit) async {
    try {
      var breedList =
          await breedRepo.listOfBreeds(start: state.breedList.length);
      state.breedList.addAll(breedList);

      emit(ExploreListState(
        status: ExploreListStatus.success,
        breedList: state.breedList,
      ));
    } catch (e) {
      emit(ExploreListState(
        status: ExploreListStatus.error,
        breedList: state.breedList,
      ));
    }
  }
}
