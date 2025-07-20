import 'package:flutter/material.dart';
import 'package:necter_app/splashscreen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
    apiKey: "AIzaSyAuRHiJ1zNHigsTZfI5W9FQkvGFrUOzLeI",
    appId: "1:894754101364:android:555e98796bdb8ce7499921",
    messagingSenderId: "894754101364",
    projectId: "necterapp-4cd9c",
  ));
  runApp(const MyWidget());
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splashscreen(),
    );
  }
}
