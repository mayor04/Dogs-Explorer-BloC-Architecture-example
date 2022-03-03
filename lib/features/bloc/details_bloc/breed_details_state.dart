part of 'breed_details_bloc.dart';

enum BreedDetailsStatus { initial, retreived, error }

@immutable
class BreedDetailsState extends Equatable {
  final String breedName;
  final List<String> images;
  final List<String> description;
  final BreedDetailsStatus status;

  const BreedDetailsState(
      {this.breedName = '',
      this.images = const [],
      this.description = const [],
      this.status = BreedDetailsStatus.initial});

  @override
  // TODO: implement props
  List<Object?> get props => [breedName, description, images];
}
