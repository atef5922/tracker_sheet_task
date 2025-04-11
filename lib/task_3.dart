import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ListView Example',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: ListViewExample(),
    );
  }
}

class ListViewExample extends StatelessWidget {
  final List<int> items = List<int>.generate(100, (index) => index + 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ListView Example')),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(title: Text('Item ${items[index]}'));
        },
      ),
    );
  }
}
