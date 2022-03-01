part of 'explore_list_bloc.dart';

enum ExploreListStatus { initial, success, error }

@immutable
class ExploreListState {
  final ExploreListStatus status;
  final List<BreedDataModel> breedList;

  const ExploreListState({
    this.status = ExploreListStatus.initial,
    this.breedList = const [],
  });
}
