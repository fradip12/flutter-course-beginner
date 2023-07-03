import 'package:course/data-layer/models/source_models.dart';

class Articles {
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;
  ArticleSource? source;

  Articles({
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
    this.source,
  });

  factory Articles.fromJson(Map<String, dynamic> json) {
    return Articles(
      author: json['author'],
      content: json['content'],
      description: json['description'],
      publishedAt: json['publishedAt'],
      url: json['url'],
      title: json['title'],
      urlToImage: json['urlToImage'],
      source: json['source'] != null || json['source'] != ''
          ? ArticleSource.fromJson(
              json['source'],
            )
          : ArticleSource.empty(),
    );
  }
}
