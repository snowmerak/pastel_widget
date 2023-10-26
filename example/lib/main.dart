import 'package:flutter/material.dart';
import 'package:pastel_widget/pastel_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final options = [
      const MapEntry('SM3', 'SM3'),
      const MapEntry('SM5', 'SM5'),
      const MapEntry('SM6', 'SM6'),
      const MapEntry('SM7', 'SM7'),
      const MapEntry('SM8', 'SM8'),
      const MapEntry('SM9', 'SM9'),
    ];

    callback(List<String> value) {
      print(value);
    }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Auto Complete Test'),
        ),
        body: Container(
          margin: const EdgeInsets.all(20),
          child:
              MultiAutocomplete<String>(options: options, callback: callback),
        ),
      ),
    );
  }
}
