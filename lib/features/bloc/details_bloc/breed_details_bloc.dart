import 'package:bloc/bloc.dart';
import 'package:dog_app/features/repository/breed_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'breed_details_event.dart';
part 'breed_details_state.dart';

class BreedDetailsBloc extends Bloc<BreedDetailsEvent, BreedDetailsState> {
  final BreedRepository breedRepo;

  BreedDetailsBloc(this.breedRepo) : super(const BreedDetailsState()) {
    on<RetrieveDetailsEvent>(_retreive);
  }

  Future<void> _retreive(
      RetrieveDetailsEvent event, Emitter<BreedDetailsState> emit) async {
    try {
      var breedDetailsModel = await breedRepo.getBreedDetails(event.breedName);
      emit(BreedDetailsState(
        status: BreedDetailsStatus.retreived,
        images: breedDetailsModel.breedImages,
        breedName: breedDetailsModel.breedName,
        description: breedDetailsModel.breedDescription,
      ));
    } catch (e) {
      emit(const BreedDetailsState(
        status: BreedDetailsStatus.error,
      ));
    }
  }
}
