import 'package:advance_todo/advance_todo.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(const MyWidget());
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, 
        home: AdvanceTodo(),);
  }
}

