import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture_example/modules/search/infra/datasource/search_datasource.dart';

import '../../domain/entities/result_search.dart';
import '../../domain/errors/errors.dart';
import '../../domain/repositories/search_repository.dart';

class SearchRepositoryImpl implements SearchRepository {

    final SearchDatasource? datasource;

    SearchRepositoryImpl(this.datasource);

  @override
  Future<Either<FailureSearch, List<ResultSearch>>> search(String? searchText) async {
    
    try{
      final result = await datasource!.getSearch(searchText!);
      return Right(result);
    } on Exception{
      return Left(DatasourceError());
    }


  }
}