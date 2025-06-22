import 'package:flutter/material.dart';
import 'package:ice_cream/splash_screen.dart';
void main(){
  runApp(const MyWidget());
}
class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}