import 'package:flutter/material.dart';
import 'package:whatsapp_clone/splash_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0XFFF00A884)),
        useMaterial3: false,
        fontFamily: "Regular",
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
