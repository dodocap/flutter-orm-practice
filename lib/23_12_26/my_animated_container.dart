import 'dart:math';

import 'package:flutter/material.dart';

class MyAnimatedContainer extends StatefulWidget {
  const MyAnimatedContainer({super.key});

  @override
  State<MyAnimatedContainer> createState() => _MyAnimatedContainerState();
}

class _MyAnimatedContainerState extends State<MyAnimatedContainer> {
  double _width = 50;
  double _height = 50;
  Color _color = Colors.green;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AnimatedContainer'),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: const Duration(seconds: 1),
          width: _width,
          height: _height,
          color: _color,
          curve: Curves.fastOutSlowIn,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final Random random = Random();
          setState(() {
            _width = random.nextInt(300).toDouble();
            _height = random.nextInt(300).toDouble();
            _color = Color.fromRGBO(random.nextInt(256), random.nextInt(256), random.nextInt(256), 1);
          });
        },
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}
