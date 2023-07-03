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
        title: const Text('Material App Example'),
      ),
      body: const Center(
        child: Text('body widget'),
      ),
    );
  }
}
