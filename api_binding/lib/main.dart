import 'package:api_binding/homepage.dart';
import 'package:flutter/material.dart';
void main(){
  runApp(const Apibinding());
}

class Apibinding extends StatelessWidget {
  const Apibinding({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepage()
    );
  }
}