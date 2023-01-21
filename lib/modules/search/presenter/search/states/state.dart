import '../../../domain/entities/result_search.dart';

abstract class SearchState {

}

class SearchSuccess implements SearchState {
  final List<ResultSearch> list;

  SearchSuccess(this.list);
}

class SearchError implements SearchState {
  final String message;

  SearchError(this.message);
}

class SearchLoading implements SearchState {}
class SearchStart implements SearchState {}