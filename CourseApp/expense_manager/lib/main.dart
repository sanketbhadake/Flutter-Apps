import 'package:expense_manager/loginscreen.dart';
import 'package:expense_manager/splashscreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Mainfile());
}

class Mainfile extends StatefulWidget {
  const Mainfile({super.key});

  @override
  State<Mainfile> createState() => _MainfileState();
}

class _MainfileState extends State<Mainfile> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Loginscreen(),

      // Splashscreen(),
    );
  }
}
