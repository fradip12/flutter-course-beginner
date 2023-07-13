import 'package:course/pages/card_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: MaterialHomePage(),
    );
    // return const CupertinoApp(
    //   title: 'Flutter Demo',
    //   theme: CupertinoThemeData(),
    //   home: CupertinoHomePage(),
    // );
  }
}

class CupertinoHomePage extends StatelessWidget {
  const CupertinoHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Cupertino App Example'),
      ),
      child: Center(
        child: Text('body widget'),
      ),
    );
  }
}

class MaterialHomePage extends StatelessWidget {
  const MaterialHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back_ios_new_sharp),
        title: const Text('Appbar '),
        actions: const [Icon(Icons.menu)],
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search Item',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    color: Colors.black,
                    width: 2,
                  ),
                ),
              ),
            ),
          ),
          ListView.separated(
            itemCount: 10,
            shrinkWrap: true,
            primary: true,
            separatorBuilder: (_, index) {
              return const Divider();
            },
            itemBuilder: (_, index) {
              return GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CardPages(
                      number: index,
                    ),
                  ),
                ),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    child: Text('$index'),
                  ),
                ),
              );
            },
          ),
        ],
      ),
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
