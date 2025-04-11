import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Date & Time Picker',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const DateTimePickerScreen(),
    );
  }
}

class DateTimePickerScreen extends StatefulWidget {
  const DateTimePickerScreen({super.key});

  @override
  State<DateTimePickerScreen> createState() => _DateTimePickerScreenState();
}

class _DateTimePickerScreenState extends State<DateTimePickerScreen> {
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  Future<void> _pickDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Future<void> _pickTime() async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime ?? TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  String get formattedDate {
    if (selectedDate == null) return 'No date selected';
    return '${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}';
  }

  String get formattedTime {
    if (selectedTime == null) return 'No time selected';
    return selectedTime!.format(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Date & Time Picker')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _pickDate,
              child: const Text('Pick a Date'),
            ),
            const SizedBox(height: 12),
            Text('Selected Date: $formattedDate'),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _pickTime,
              child: const Text('Pick a Time'),
            ),
            const SizedBox(height: 12),
            Text('Selected Time: $formattedTime'),
          ],
        ),
      ),
    );
  }
}
