import 'package:flutter/material.dart';

class MyOrientation extends StatefulWidget {
  const MyOrientation({super.key});

  @override
  State<MyOrientation> createState() => _MyOrientationState();
}

class _MyOrientationState extends State<MyOrientation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OrientationBuilder'),
      ),
      body: OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
          return GridView.count(
            crossAxisCount: orientation == Orientation.portrait ? 3 : 5,
            children: List.generate(50, (index) {
              return Center(child: Text('Item $index'));
            }),
          );
        },
      ),
    );
  }
}
