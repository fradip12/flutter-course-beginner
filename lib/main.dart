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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => print('elevated button'),
              child: const Text('elevated button'),
            ),
            TextButton(
              onPressed: () => print('text button'),
              child: Text('Text Button'),
            ),
            OutlinedButton(
              onPressed: () => print('outlined button'),
              child: Text('Outlined Button'),
            )
          ],
        ),
      ),
    );
  }
}
