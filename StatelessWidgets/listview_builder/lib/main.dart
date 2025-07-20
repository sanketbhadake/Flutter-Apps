import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowMaterialGrid: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("listView Builder"),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: ListView.builder(
            itemCount: 30,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (BuildContext context, int count) {
              return Text(
                "index: $count",
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.w800)
                    ,
              );
              
            }),
      ),
    );
  }
}
