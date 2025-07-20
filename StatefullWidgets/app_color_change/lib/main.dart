import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State createState() => _MyAppState();
}

class _MyAppState extends State {
  bool changecolors = true;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Stateful widget',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Stateful widget'),
          centerTitle: true,
          backgroundColor: (changecolors) ? Colors.yellow : Colors.green,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (changecolors) {
              changecolors = false;
            } else {
              changecolors = true;
            }
            setState(() {});
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
