import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture_example/modules/search/domain/entities/result_search.dart';
import 'package:flutter_clean_architecture_example/modules/search/domain/errors/errors.dart';
import 'package:flutter_clean_architecture_example/modules/search/domain/usecases/search_by_text.dart';
import 'package:flutter_clean_architecture_example/modules/search/presenter/search/search_bloc.dart';
import 'package:flutter_clean_architecture_example/modules/search/presenter/search/states/state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class SearchByTextMock extends Mock implements SearchByText {}

void main() {
  
  final usecase = SearchByTextMock();
  final bloc = SearchBloc(usecase);
  
  test("deve retornar os estatos na ordem correta",() async* {

    when(() => usecase.call(any())).thenAnswer((_) async => Right(<ResultSearch>[]));
    expect(bloc, emits([
      isA<SearchLoading>(),
      isA<SearchSuccess>(),
    ]));
    bloc.add("vinicio");
  });

  test("deve retornar error",() async* {

    when(() => usecase.call(any())).thenAnswer((_) async => Left(InvalidTextError()));
    expect(bloc, emits([
      isA<SearchLoading>(),
      isA<SearchError>(),
    ]));
    bloc.add("vinicio");
  });
}