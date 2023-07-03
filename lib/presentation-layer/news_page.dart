import 'package:course/data-layer/api/api_remote.dart';
import 'package:flutter/material.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// [5.3] [Future Builder] untuk menggunakan services future get articles
    /// yang akan mengembalikan data ke dalam builder ketika data sudah selesai di request5.3 future
    return FutureBuilder(
      future: ApiServices().getArticles(),
      builder: (_, data) {
        return Container();
      },
    );
  }
}
