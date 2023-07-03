import 'package:course/data-layer/api/api_remote.dart';
import 'package:flutter/material.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiServices().getArticles(),
      builder: (_, data) {
        return Container();
      },
    );
  }
}
