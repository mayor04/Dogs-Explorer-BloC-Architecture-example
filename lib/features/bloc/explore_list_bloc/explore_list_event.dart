part of 'explore_list_bloc.dart';

@immutable
abstract class ExploreListEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class ExploreListInitial extends ExploreListEvent {}

class ExploreListMore extends ExploreListEvent {}
