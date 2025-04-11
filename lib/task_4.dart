import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const TextStyleExample(),
    );
  }
}

class TextStyleExample extends StatelessWidget {
  const TextStyleExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Text Styling Example:Task 04")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Bold Text',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Italic Text',
              style: TextStyle(fontSize: 24, fontStyle: FontStyle.italic),
            ),
            SizedBox(height: 10),
            Text(
              'Colored Text',
              style: TextStyle(fontSize: 22, color: Colors.blue),
            ),
            SizedBox(height: 10),
            Text(
              'Underlined Text',
              style: TextStyle(
                fontSize: 20,
                decoration: TextDecoration.underline,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Custom Font Size & Weight',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
