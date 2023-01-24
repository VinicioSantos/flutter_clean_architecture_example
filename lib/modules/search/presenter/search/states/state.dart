import '../../../domain/entities/result_search.dart';
import '../../../domain/errors/errors.dart';

abstract class SearchState {

}

class SearchSuccess implements SearchState {
  final List<ResultSearch> list;

  SearchSuccess(this.list);
}

class SearchStart implements SearchState {}

class SearchLoading implements SearchState {}

class SearchError implements SearchState {
  final FailureSearch message;

  SearchError(this.message);
}


