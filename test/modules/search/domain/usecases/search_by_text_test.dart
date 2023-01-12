import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:flutter_clean_architecture_example/modules/search/domain/entities/result_search.dart';
import 'package:flutter_clean_architecture_example/modules/search/domain/errors/errors.dart';
import 'package:flutter_clean_architecture_example/modules/search/domain/repositories/search_repository.dart';
import 'package:flutter_clean_architecture_example/modules/search/domain/usecases/search_by_text.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';


class SearchRepositoryMock extends Mock implements SearchRepository {
}

void main(){

final repository = SearchRepositoryMock();

final usecase = SearchByTextImpl(repository);


  test('deve retornar uma lista de ResultSearch', () async {
    when(() => repository.search(any())).thenAnswer((_) async => 
        Right(<ResultSearch>[])
    );
    final result = await usecase('searchText');
    expect(result, isA<Right>());
    expect(result.getOrElse(() => []), isA<List<ResultSearch>>());
  });

    test('deve retornar uma exception caso o texto seja valido', () async {
    when(() => repository.search(any())).thenAnswer((_) async => 
        Right(<ResultSearch>[])
    );
    final result = await usecase(null);
    expect(result.isLeft(), true);
    expect(result.fold(id, id), isA<InvalidTextError>());
  });
}