// ignore_for_file: non_constant_identifier_names, unrelated_type_equality_checks

class BusArticle {
  static List<BArticle> article = [];
  BArticle getById(int id) =>
      article.firstWhere((element) => element.id == id, orElse: (null));
  BArticle getByPos(int pos) => article[pos];
}

class BArticle {
  final num id;
  final String name;
  final String desc;
  final String Date;
  final String time;
  final String Author;
  final String image;
  final String auth_image;
  final String article;

  BArticle(
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

  factory BArticle.fromMap(Map<String, dynamic> map) {
    return BArticle(
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