import 'package:dio/dio.dart';
import 'package:flutter_clean_architecture_example/modules/search/infra/models/result_search_model.dart';

import '../../infra/datasource/search_datasource.dart';

class GithubDatasource implements SearchDatasource {
  
  late final Dio dio;

  GithubDatasource(this.dio);
  
  @override
  Future<List<ResultSearchModel>> getSearch(String searchText) async {
    final response = await dio.get("https://api.github.com/search/users?q=${_normalizeText(searchText)}");
  
    if(response.statusCode == 200){
      final list = (response.data["items"] as List)
        .map((e) => ResultSearchModel.fromMap(e))
        .toList();
      return list;
    } else {
      throw Exception();
    }
  }

  String _normalizeText(String searchText) {
    return searchText.replaceAll(" ", "+");
  }
}