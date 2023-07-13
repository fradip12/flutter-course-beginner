import 'package:flutter/material.dart';

class CardPages extends StatelessWidget {
  final int? number;
  const CardPages({Key? key, this.number}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pages ${number ?? 0}'),
      ),
      body: Center(
        child: Text(
          '${number ?? 0}',
          style: const TextStyle(fontSize: 32),
        ),
      ),
    );
  }
}
