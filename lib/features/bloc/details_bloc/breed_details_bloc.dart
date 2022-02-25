import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'breed_details_event.dart';
part 'breed_details_state.dart';

class BreedDetailsBloc extends Bloc<BreedDetailsEvent, BreedDetailsState> {
  BreedDetailsBloc() : super(BreedDetailsInitial()) {
    on<BreedDetailsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
