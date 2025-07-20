import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text("Container Gradient"),
            centerTitle: true,
            backgroundColor: Colors.blue,
          ),
          body: Center(
            child: Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomCenter,
                      colors: [
                    Color.fromARGB(255, 34, 135, 172),
                    Color.fromARGB(255, 219, 14, 14)
                  ])),
              height: 200,
              width: 200,
              child: const Center(
                child: Text(
                  textAlign: TextAlign.center,
                  "Incubuter",
                  style: TextStyle(fontSize: 25),
                ),
              ),
            ),
          )),
    );
  }
}
