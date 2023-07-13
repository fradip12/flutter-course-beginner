import 'package:cached_network_image/cached_network_image.dart';
import 'package:course/data-layer/api/api_remote.dart';
import 'package:course/data-layer/models/response_model.dart';
import 'package:course/helper/database.dart';
import 'package:flutter/material.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  late DatabaseHelper db;
  late ApiServices services;
  @override
  void initState() {
    super.initState();
    db = DatabaseHelper();
    services = ApiServices(db);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder<ArticlesResponse?>(
          future: services.getArticles(),
          builder: (_, data) {
            if (data.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
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
                          CachedNetworkImage(
                            imageUrl:
                                data.data?.articles?[index].urlToImage ?? '',
                            errorWidget: (context, url, error) {
                              return Container(
                                color: Colors.grey,
                                width: double.infinity,
                                height: 150,
                              );
                            },
                          ),
                          // Container(
                          //   width: 125,
                          //   height: 125,
                          //   decoration: BoxDecoration(
                          //     image: DecorationImage(
                          //       image: NetworkImage(
                          //         data.data?.articles?[index].urlToImage ?? '',
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          const SizedBox(height: 5),
                          Text(
                            data.data?.articles?[index].title ?? '-',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontWeight: FontWeight.w700),
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
              child: Text('No Item'),
            );
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
