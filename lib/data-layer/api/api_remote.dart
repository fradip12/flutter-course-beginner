import 'dart:convert';

import 'package:course/data-layer/models/response_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const apiKey = '56dbfed2073d408db341a4d738adaae1';

class ApiServices {
  final endpoint = 'https://newsapi.org/v2/everything?q=tesla&apiKey=$apiKey';

  /// Future function berguna untuk pemanggilan data remote dari server agar dapat mengembalikan data sesuai dengan lama
  /// request kembalian dari server
  ///
  /// [async] flag bertanda bahwa function kita merupakan function [future]
  Future<ArticlesResponse?> getArticles() async {
    final url = Uri.parse(endpoint);
    // function await akan menunggu request sampai mengembalikan response dan code line selanjutnya akan dijalan ketika proses request telah selesai
    final response = await http.get(url);

    // Jika request berhasil status code == 200
    if (response.statusCode == 200) {
      debugPrint(response.body);
      return ArticlesResponse.fromJson(json.decode(response.body));
    } else {
      return null;
    }
  }
}
