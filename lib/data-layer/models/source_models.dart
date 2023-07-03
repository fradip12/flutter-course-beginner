class ArticleSource {
  String? id;
  String? name;

  ArticleSource({this.id, this.name});

  /// Singleton pattern (factory) : menerapkan singleton adalah sebuah best practice yang tepat
  /// Singleton pada umumnya digunakan ketika kita akan menggunakan instance class yang sama,
  ///
  /// more in : https://dart.dev/language/constructors
  factory ArticleSource.fromJson(Map<String, dynamic> json) {
    return ArticleSource(
      id: json['id'],
      name: json['name'],
    );
  }

  factory ArticleSource.empty() {
    return ArticleSource(
      id: '',
      name: '',
    );
  }
}
