import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'explore_list_event.dart';
part 'explore_list_state.dart';

class ExploreListBloc extends Bloc<ExploreListEvent, ExploreListState> {
  ExploreListBloc() : super(ExploreListInitial()) {
    on<ExploreListEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
