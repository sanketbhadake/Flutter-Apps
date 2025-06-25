import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ice_cream/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyDbNCrDOQcRIw-oN9OFBaPEgoC2nZfhOwc",
      appId: "1:519428005294:android:aad4f68fca08e743f7bc3f",
      messagingSenderId: "519428005294",
      projectId: "ice-creame-app",
    ),
  );

  runApp(const MyWidget());
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: SplashScreen(), debugShowCheckedModeBanner: false);
  }
}
