import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture_example/modules/search/domain/entities/result_search.dart';
import 'package:flutter_clean_architecture_example/modules/search/domain/errors/errors.dart';
import 'package:flutter_clean_architecture_example/modules/search/infra/datasource/search_datasource.dart';
import 'package:flutter_clean_architecture_example/modules/search/infra/models/result_search_model.dart';
import 'package:flutter_clean_architecture_example/modules/search/infra/repositories/search_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class SearchDatasourceMock extends Mock implements SearchDatasource{}


main(){
  final datasource = SearchDatasourceMock();  

  final repository = SearchRepositoryImpl(datasource);

  test('deve retornar uma lista de Resultsearch', () async{
    when(() => datasource.getSearch(any()))
    .thenAnswer((_) async => <ResultSearchModel>[]);

    final result = await repository.search('searchText');

    expect(result.fold(id, id), isA<List<ResultSearch>>());
  });

    test('deve retornar um erro se o datasource falhar', () async{
    when(() => datasource.getSearch(any())).thenThrow(Exception());

    final result = await repository.search('searchText');

    expect(result.fold(id, id), isA<DatasourceError>());
  });
}