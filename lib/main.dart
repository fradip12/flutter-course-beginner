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
      /// [AppBar]
      /// beberapa komponen inti pada appbar yaitu :
      /// [Leading] : icon sebelah kiri title, lebih banyak di pakai untuk icon back, untuk lebih mudah atau otomatis
      /// dapat menggunakan property automatically leading : true
      ///
      /// [Actions] : icon yang berada di sebelah kanan title appbar, biasa digunakan untuk actions seperti menu
      ///
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back_ios_new_sharp),
        title: const Text('Appbar '),
        actions: const [Icon(Icons.menu)],
      ),

      /// Di body kita bisa memasukkan widget atau menu aplikasi yang akan kita buat
      ///
      /// Listview separated sama seperti builder dan dapat di sisipkan separator diantara item listview
      body: ListView.separated(
        itemCount: 10,
        separatorBuilder: (_, index) {
          return const Divider();
        },
        itemBuilder: (_, index) {
          return GestureDetector(
            onTap: () {
              print(index);
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Container(
                padding: const EdgeInsets.all(12),
                child: Text('$index'),
              ),
            ),
          );
        },
      ),

      /// Listview builder : listview dengan item dynamic. dapat di buat berdasarkan data yang dynamics
      //     ListView.builder(
      //   itemCount: 10,
      //   itemBuilder: (_, index) {
      //     return Card(
      //       shape:
      //           RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      //       child: Container(
      //         padding: const EdgeInsets.all(12),
      //         child: Text('$index'),
      //       ),
      //     );
      //   },
      // ),

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

      /// Floating action button biasa di gunakan untuk menu floating seperti add
      /// atau digunakan sebagai menu alternatif
      floatingActionButton: const FloatingActionButton(
        onPressed: null,
        child: Icon(Icons.add),
      ),

      /// Ada beberapa property lain lagi di dalam Scaffold, untuk itu teman" silahkan explore dan bereksperimen sendiri
    );
  }
}
