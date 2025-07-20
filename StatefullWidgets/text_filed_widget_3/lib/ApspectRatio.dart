import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Apspect Ratio",
            style: TextStyle(fontWeight: FontWeight.w800),
          ),
          backgroundColor: Colors.blue,
        ),
        body: Center(
          child: Container(
            height: 300,
            width: 300,
            color: Colors.black,
            child: Image.network(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQA_DECuKNB02X20S6MoVln_OQqYpN9EcivwG9NdEtztfCOmlXY3eZYtbRfjhFcdTU5B-o&usqp=CAU",
                fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }
}
