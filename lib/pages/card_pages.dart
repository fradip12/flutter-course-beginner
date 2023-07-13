import 'package:flutter/material.dart';

class CardPages extends StatelessWidget {
  final int? number;
  const CardPages({Key? key, this.number}) : super(key: key);

  void _snackbar(context) {
    const snackBar = SnackBar(
      content: Text('Yay! A SnackBar!'),
      backgroundColor: Colors.amber,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void _dialog(context) {
    showDialog(
      context: context,
      builder: (_) {
        return const AlertDialog(
          title: Text('AlertDialog Title'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('This is a demo alert dialog.'),
                Text('Would you like to approve of this message?'),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pages ${number ?? 0}'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${number ?? 0}',
              style: const TextStyle(fontSize: 32),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Kembali'),
            ),
            ElevatedButton(
              onPressed: () {
                _snackbar(context);
              },
              child: const Text('Snackbar'),
            ),
            ElevatedButton(
              onPressed: () {
                _dialog(context);
              },
              child: const Text('Warning Dialog'),
            ),
          ],
        ),
      ),
    );
  }
}
