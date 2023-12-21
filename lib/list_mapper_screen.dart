import 'package:flutter/material.dart';

class MainListPage extends StatefulWidget {
  final Map<String, Widget> _widgetMapper;
  final String _title;

  const MainListPage({
    super.key,
    required String title,
    required Map<String, Widget> widgetMapper,
  })  : _title = title,
        _widgetMapper = widgetMapper;

  @override
  State<MainListPage> createState() => _MainListPageState();
}

class _MainListPageState extends State<MainListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget._title),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: ListView(
            children: widget._widgetMapper.entries
                .map((e) => ListTile(
                      title: Text(e.key),
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => e.value)),
                    ))
                .toList()),
      ),
    );
  }
}
