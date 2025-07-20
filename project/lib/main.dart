import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:project/cookies.dart';

import 'package:project/splashScreen.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'cookies.dart';

dynamic database;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
 
  await Firebase.initializeApp();
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splashscreen(),
    );
  }
}
