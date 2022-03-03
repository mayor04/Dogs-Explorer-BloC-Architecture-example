part of 'breed_details_bloc.dart';

@immutable
abstract class BreedDetailsEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class RetrieveDetailsEvent extends BreedDetailsEvent {
  final String breedName;
  RetrieveDetailsEvent(this.breedName);

  @override
  List<Object?> get props => [breedName];
}
