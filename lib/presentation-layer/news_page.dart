import 'package:course/data-layer/api/api_remote.dart';
import 'package:course/data-layer/models/response_model.dart';
import 'package:flutter/material.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// [5.3] [Future Builder] untuk menggunakan services future get articles
    /// yang akan mengembalikan data ke dalam builder ketika data sudah selesai di request5.3 future
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder<ArticlesResponse?>(
          future: ApiServices().getArticles(),
          builder: (_, data) {
            switch (data.connectionState) {
              case ConnectionState.waiting:
                return const Center(child: CircularProgressIndicator());
              case ConnectionState.none:
                return const Center(
                  child: Text('No item'),
                );
              case ConnectionState.done:
                if (data.hasData) {
                  return ListView.builder(
                    itemCount: 10,
                    itemBuilder: (_, index) {
                      return Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 125,
                                height: 125,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      data.data?.articles?[index].urlToImage ??
                                          '',
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                data.data?.articles?[index].title ?? '-',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w700),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                data.data?.articles?[index].description ?? '-',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 5),
                              Text(
                                data.data?.articles?[index].publishedAt ?? '-',
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
                return const Center(
                  child: Text('No item'),
                );
              default:
                return Container();
            }
          },
        ),
      ),

      /// Bottom Navigation bar biasa digunakan unttuk menu bar, bisa berisi home, account, dan lain lain.
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            label: 'Bottom 1',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: 'Bottom 2',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: 'Bottom 3',
            icon: Icon(Icons.home),
          ),
        ],
      ),
    );
  }
}
