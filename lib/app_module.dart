
import 'package:dio/dio.dart';
import 'package:flutter_clean_architecture_example/modules/search/domain/usecases/search_by_text.dart';
import 'package:flutter_clean_architecture_example/modules/search/infra/repositories/search_repository_impl.dart';
import 'package:flutter_clean_architecture_example/modules/search/presenter/search/search_bloc.dart';
import 'package:flutter_clean_architecture_example/modules/search/presenter/search/search_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app_widget.dart';
import 'modules/search/external/datasources/github_datasource.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => SearchByTextImpl(i())),
    Bind((i) => SearchRepositoryImpl(i())),
    Bind((i) => GithubDatasource(i())),
    Bind((i) => Dio()),
    Bind((i) => SearchBloc(i()))
  ];

  @override
  final List<ModularRoute> routes = [
//rota de pesquisa
        ChildRoute('/', child: (context, args) => SearchPage()),
  ];
}