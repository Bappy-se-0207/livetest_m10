import 'package:flutter/material.dart';
import 'SelectionScreen.dart';

void main() {
  runApp(const MyApp());
}

class Item {
  String name;
  bool isSelected;

  Item(this.name, this.isSelected);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Selection Item App',
      home: const SelectionScreen(),
    );
  }
}
