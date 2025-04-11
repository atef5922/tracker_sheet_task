import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Stateful Button App',
      home: ButtonChangeTextPage(),
    );
  }
}

class ButtonChangeTextPage extends StatefulWidget {
  const ButtonChangeTextPage({super.key});

  @override
  State<ButtonChangeTextPage> createState() => _ButtonChangeTextPageState();
}

class _ButtonChangeTextPageState extends State<ButtonChangeTextPage> {
  String displayText = "Press the button";

  void _changeText() {
    setState(() {
      displayText = "Button Pressed";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Task 02 Example:')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(displayText, style: const TextStyle(fontSize: 26)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _changeText,
              child: const Text('Press Me'),
            ),
          ],
        ),
      ),
    );
  }
}
