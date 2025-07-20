import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State createState() => _MyAppstate();
}

class _MyAppstate extends State {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Counter app",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Counter App"),
          backgroundColor: Colors.green,
          centerTitle: true,
        ),
        body: Center(
          child: Text(
            '$counter',
            style: const TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            counter++;
            setState(() {});
          },
          backgroundColor: Colors.green,
          child: const Icon(Icons.add),
        ),
      ),
    ));
  }
}
