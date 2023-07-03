import 'package:course/data-layer/models/articles_models.dart';

class ArticlesResponse {
  String? status;
  int? totalResult;
  List<ArticlesModels>? articles;

  ArticlesResponse({
    this.status,
    this.totalResult,
    this.articles,
  });

  factory ArticlesResponse.fromJson(Map<String, dynamic> json) {
    return ArticlesResponse(
      articles: (json['articles'] as List)
          .map((e) => ArticlesModels.fromJson(e))
          .toList(),
      status: json['status'],
      totalResult: json['totalResults'],
    );
  }
}
