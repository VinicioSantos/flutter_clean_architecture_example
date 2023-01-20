import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_clean_architecture_example/app_module.dart';
import 'package:flutter_clean_architecture_example/modules/search/domain/entities/result_search.dart';
import 'package:flutter_clean_architecture_example/modules/search/domain/usecases/search_by_text.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'search/utils/github_response.dart';

class DioMock extends Mock implements Dio {}


main(){

  final dio = DioMock();

  setUpAll(() {
    Modular.init(AppModule());
    Bind.instance<Dio>(dio);
  });


  test("deve recuperar o usecase sem erro", (){
    final usecase = Modular.get<SearchByText>();
    expect(usecase, isA<SearchByTextImpl>());
  });
  
  test("deve trazer uuma lista de ResultSearch", () async {
    when(() => dio.get(any())).thenAnswer((_) async =>
        Response(data: jsonDecode(githubResult),
            statusCode: 200,
            requestOptions: RequestOptions(path: "")));

    final usecase = Modular.get<SearchByText>();
    final result = await usecase("Vinicio");

    expect(result | [], isA<List<ResultSearch>>());
  });
}