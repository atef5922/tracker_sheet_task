import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animated Container',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: const AnimatedContainerExample(),
    );
  }
}

class AnimatedContainerExample extends StatefulWidget {
  const AnimatedContainerExample({super.key});

  @override
  State<AnimatedContainerExample> createState() =>
      _AnimatedContainerExampleState();
}

class _AnimatedContainerExampleState extends State<AnimatedContainerExample> {
  double _width = 100;
  double _height = 100;
  Color _color = Colors.blue;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8);

  void _changeContainer() {
    final random = Random();

    setState(() {
      _width = random.nextDouble() * 200 + 100;
      _height = random.nextDouble() * 200 + 100;
      _color = Color.fromRGBO(
        random.nextInt(256),
        random.nextInt(256),
        random.nextInt(256),
        1,
      );
      _borderRadius = BorderRadius.circular(random.nextDouble() * 100);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Animated Container App Design')),
      body: Center(
        child: AnimatedContainer(
          width: _width,
          height: _height,
          decoration: BoxDecoration(color: _color, borderRadius: _borderRadius),
          duration: const Duration(seconds: 1),
          curve: Curves.easeInOut,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _changeContainer,
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}
