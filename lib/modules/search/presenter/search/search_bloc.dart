import 'package:bloc/bloc.dart';
import 'package:flutter_clean_architecture_example/modules/search/domain/usecases/search_by_text.dart';
import 'package:flutter_clean_architecture_example/modules/search/presenter/search/states/state.dart';

class SearchBloc extends Bloc<String, SearchState> {
  
  final SearchByText usecase;
  
  SearchBloc(this.usecase) : super(SearchStart()){
    on<String>((event, emit) async {
      emit(SearchLoading());
      final result = await usecase(event);
      emit(result.fold((l) => SearchError(l), (r) => SearchSuccess(r)));
    });
  }

  // //state changes
  // //@override
  // on<E extends String>(EventHandler<E, SearchState> handler, {EventTransformer<E>? transformer}) async {
  //   // TODO: implement on
  //   emit(SearchLoading());
  //   final result = await usecase(handler as String);
  //   emit(result.fold((l) => SearchError(l), (r) => SearchSuccess(r)));
  // }

  // Stream<SearchState> mapEventToState(String searchText) async* {
  //   yield SearchLoading();
  //   final result = await usecase(searchText);
  //   //await Future.delayed(Duration(seconds: 2));
  //   yield result.fold((l) => SearchError(l), (r) => SearchSuccess(r));
  // }
}