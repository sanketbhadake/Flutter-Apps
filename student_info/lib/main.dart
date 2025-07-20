

 
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
 
import 'package:student_info/student_info.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey:  "AIzaSyCTy49H0zNsl6XIyMvZQvNsqkfHVNqF6uM",
        appId: "1:522081944879:android:28f6d36d5e6923b7e64dda",
        messagingSenderId:  "522081944879",
        projectId: "student-info-5f363"),
  );
  runApp(const FirebaseApp());
}

class FirebaseApp extends StatelessWidget {
  const FirebaseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Firebase App",
      home: Employee(),
    );
  }
}
