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
      MapEntry('SM3', 'SM3'),
      MapEntry('SM5', 'SM5'),
      MapEntry('SM6', 'SM6'),
      MapEntry('SM7', 'SM7'),
      MapEntry('SM8', 'SM8'),
      MapEntry('SM9', 'SM9'),
    ];

    final callback = (List<String> value) {
      print(value);
    };

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Auto Complete Test'),
        ),
        body: Container(
          margin: EdgeInsets.all(20),
          child:
              MultiAutocomplete<String>(options: options, callback: callback),
        ),
      ),
    );
  }
}
