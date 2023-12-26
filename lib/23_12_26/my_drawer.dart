import 'package:flutter/material.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Drawer'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: const Text('Header'),
              decoration: BoxDecoration(
                color: Colors.green.shade100
              ),
            ),
            ListTile(
              title: const Text('Item 1'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              title: const Text('Item 3'),
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
      body: const Center(
        child: Text('Drawer 예제'),
      ),
    );
  }
}
