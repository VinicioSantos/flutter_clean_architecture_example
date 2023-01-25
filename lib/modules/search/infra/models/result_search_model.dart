// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import '../../domain/entities/result_search.dart';

class ResultSearchModel extends ResultSearch {
  final String? img;
  final String? title;
  final String? content;

  ResultSearchModel({ this.img, this.title, this.content});


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'img': img,
      'title': title,
      'content': content,
    };
  }

  factory ResultSearchModel.fromMap(Map<String, dynamic> map) {
    return ResultSearchModel(
      img: map['avatar_url'] != null ? map['avatar_url'] as String : null,
      title: map['login'] != null ? map['login'] as String : null,
      content: map['content'] != null ? map['content'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ResultSearchModel.fromJson(String source) => ResultSearchModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
