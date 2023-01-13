import 'package:dartz/dartz.dart';

import '../../domain/entities/result_search.dart';
import '../../domain/errors/errors.dart';
import '../../domain/repositories/search_repository.dart';

class SearchRepositoryImpl implements SearchRepository {

  @override
  Future<Either<FailureSearch, List<ResultSearch>>> search(String? searchText) {
    throw UnimplementedError();
  }
}