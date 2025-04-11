import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task 01',
      home: Scaffold(
        appBar: AppBar(title: Text('Task 01'), centerTitle: true),
        body: Center(
          child: Text(
            'Hello World!',
            style: TextStyle(
              fontSize: 30.0,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.bold,
              color: (Colors.blue),
            ),
          ),
        ),
      ),
    );
  }
}
