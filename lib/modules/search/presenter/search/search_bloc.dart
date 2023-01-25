import 'package:bloc/bloc.dart';
import 'package:flutter_clean_architecture_example/modules/search/domain/usecases/search_by_text.dart';
import 'package:flutter_clean_architecture_example/modules/search/presenter/search/states/state.dart';
import 'package:rxdart/rxdart.dart';

class SearchBloc extends Bloc<String, SearchState> {
  
  final SearchByText usecase;
  
  SearchBloc(this.usecase) : super(SearchStart()){
    on<String>((event, emit) async {
      emit(SearchLoading());
      final result = await usecase(event);
      emit(result.fold((l) => SearchError(l), (r) => SearchSuccess(r)));      
    },
    transformer: ((events, mapper) {
        return events.debounceTime(const Duration(milliseconds: 300)).asyncExpand(mapper);
    })
    );
  }
}