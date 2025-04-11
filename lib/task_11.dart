import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Asset Image Demo',
      home: AssetImageScreen(),
    );
  }
}

class AssetImageScreen extends StatelessWidget {
  const AssetImageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Local Asset Image')),
      body: Center(
        child: Image.asset(
          'assets/images/l.png',
          width: 400,
          height: 300,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
