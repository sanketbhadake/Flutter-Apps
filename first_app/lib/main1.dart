import 'package:flutter/material.dart';

void main() {
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            title: const Text("Container"),
            centerTitle: true,
            backgroundColor: Colors.amber),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                  height: 200,
                  width: 200,
                  color: const Color.fromARGB(235, 7, 251, 255)),
              Container(height: 200, width: 200, color: Colors.black),
              Container(
                  height: 200,
                  width: 200,
                  color: const Color.fromARGB(255, 229, 36, 168)),
            ],
          ),
        ),
      ),
    );
  }
}
