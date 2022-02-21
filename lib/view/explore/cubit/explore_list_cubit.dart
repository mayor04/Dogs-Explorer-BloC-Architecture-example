import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'explore_list_state.dart';

class ExploreListCubit extends Cubit<ExploreListState> {
  ExploreListCubit() : super(ExploreListInitial());
}
