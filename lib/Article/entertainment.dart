// ignore_for_file: non_constant_identifier_names, unrelated_type_equality_checks

import 'package:reading_club_open_library/core/store.dart';
import 'package:velocity_x/velocity_x.dart';

class EntArticle {
  static List<EArticle> article = [];
  EArticle getById(int id) =>
      article.firstWhere((element) => element.id == id, orElse: (null));
  EArticle getByPos(int pos) => article[pos];
}

class EArticle {
  final num id;
  final String name;
  final String desc;
  final String Date;
  final String time;
  final String Author;
  final String image;
  final String auth_image;
  final String article;

  EArticle(
    this.id,
    this.name,
    this.desc,
    this.Date,
    this.time,
    this.Author,
    this.image,
    this.auth_image,
    this.article,
  );
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'desc': desc,
      'Date': Date,
      'time': time,
      'Author': Author,
      'image': image,
      'auth_image': auth_image,
      'article': article,
    };
  }

  factory EArticle.fromMap(Map<String, dynamic> map) {
    return EArticle(
      map['id'],
      map['name'],
      map['desc'],
      map['Date'],
      map['time'],
      map['Author'],
      map['image'],
      map['auth_image'],
      map['article'],
    );
  }
}

class SearchMutation extends VxMutation<MyStore> {
  final String query;

  SearchMutation(this.query);
  @override
  perform() {
    if (query.length >= 1) {
      store!.earticle = EntArticle.article
          .where((el) => el.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    } else {
      store!.earticle = EntArticle.article;
    }
  }
}
