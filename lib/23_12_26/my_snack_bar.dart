import 'package:flutter/material.dart';

class MySnackBar extends StatefulWidget {
  const MySnackBar({super.key});

  @override
  State<MySnackBar> createState() => _MySnackBarState();
}

class _MySnackBarState extends State<MySnackBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SnackBar'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            final snackBar = SnackBar(
              content: const Text('스낵바'),
              action: SnackBarAction(label: '취소', onPressed: () { },
              ),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },
          child: const Text('Show SnackBar'),
        )
      ),
    );
  }
}
