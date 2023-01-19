import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_clean_architecture_example/modules/search/domain/errors/errors.dart';
import 'package:flutter_clean_architecture_example/modules/search/external/datasources/github_datasource.dart';
import 'package:flutter_clean_architecture_example/modules/search/infra/models/result_search_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../utils/github_response.dart';

class DioMock extends Mock implements Dio {
}


main(){
  final dio = DioMock();

  final datasource = GithubDatasource(dio);

  test("deve retornar uma lista de ResultSearchModel", () async {

    when(() => dio.get(any())).thenAnswer((_) async => 
    Response(data: jsonDecode(githubResult),
    statusCode: 200,
    requestOptions: RequestOptions(path: "")));

    final result = await datasource.getSearch("searchText");
    expect(result, isA<List<ResultSearchModel>>());
  });

    test("deve retornar um DatasourceError se a exception não for 200", () async {

    when(() => dio.get(any())).thenAnswer((_) async => 
    Response(data: jsonDecode(githubResult),
    statusCode: 401,
    requestOptions: RequestOptions(path: "")));

    final result = datasource.getSearch("searchText");
    expect(result, throwsA(isA<DatasourceError>()));
  });
}

