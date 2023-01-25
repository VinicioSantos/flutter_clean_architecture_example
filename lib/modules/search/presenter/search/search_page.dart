import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture_example/modules/search/presenter/search/search_bloc.dart';
import 'package:flutter_clean_architecture_example/modules/search/presenter/search/states/state.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  final bloc = Modular.get<SearchBloc>();

  @override
  void dispose() {
    super.dispose();
    bloc.close();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
      ),
      body: Column(children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 8.0, left: 8, top: 8),
          child: TextField(
            onChanged: bloc.add,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Search',
            ),
          ),
        ),
        Expanded(
          child: StreamBuilder(
            stream: bloc.stream,
            builder: (context, snapshot) {

              final state = bloc.state;

              if(state is SearchStart){
                return const Center(child: Text('Start searching'),);
              }

              if(state is SearchLoading){
                return const Center(child: CircularProgressIndicator(),);
              }

              if(state is SearchError){
                return const Center(child: Text("houve um erro"));
              }

              final list = (state as SearchSuccess).list;
              return ListView.builder(
                itemCount: list.length,
                itemBuilder: (_, id) {
                  final item = list[id];
                  return ListTile(
                    leading: item.img == null ? Container() : Container(
                      width: 50,
                      height: 50,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(item.img ?? ""),
                      ),
                    ),
                    title: Text(item.title ?? "a"),
                  );
                }
              );
            })
          )
      ],),
    );
  }
}