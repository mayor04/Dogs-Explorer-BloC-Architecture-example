part of 'explore_list_bloc.dart';

enum ExploreListStatus { initial, success, error }

@immutable
class ExploreListState {
  final ExploreListStatus status;
  final List<BreedDataModel> breedList;
  int get count {
    if (status == ExploreListStatus.initial) {
      return 5;
    }

    return breedList.length;
  }

  BreedDataModel? breedAt(int index) {
    return breedList.itemAt(index);
  }

  BreedDataModel? breedFromName(String? name) {
    return breedList.firstWhere((element) => element.name == name);
  }

  const ExploreListState({
    this.status = ExploreListStatus.initial,
    this.breedList = const [],
  });
}
