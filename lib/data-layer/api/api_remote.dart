import 'dart:convert';

import 'package:course/data-layer/models/articles_models.dart';
import 'package:course/data-layer/models/response_model.dart';
import 'package:course/helper/database.dart';
import 'package:data_connection_checker_nulls/data_connection_checker_nulls.dart';
import 'package:http/http.dart' as http;

const apiKey = '56dbfed2073d408db341a4d738adaae1';

class ApiServices {
  final DatabaseHelper db;
  final endpoint = 'https://newsapi.org/v2/everything?q=tesla&apiKey=$apiKey';

  ApiServices(this.db);

  Future<ArticlesResponse?> getArticles() async {
    final connected = await DataConnectionChecker().hasConnection;
    print(connected);
    if (connected) {
      final url = Uri.parse(endpoint);
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = ArticlesResponse.fromJson(json.decode(response.body));
        db.insertCache(articles: data);
        return data;
      } else {
        return null;
      }
    } else {
      final response = await db.getCache();
      final articles = response.map((e) => ArticlesModels.fromJson(e)).toList();
      print(articles);
      if (articles.isNotEmpty) {
        final data = ArticlesResponse(
          articles: articles,
          totalResult: articles.length,
        );
        return data;
      } else {
        return null;
      }
    }
  }
}
