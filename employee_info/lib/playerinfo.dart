import 'package:flutter/material.dart';


void main() {
  runApp(const FirebaseApp());
}

class FirebaseApp extends StatelessWidget {
  const FirebaseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Firebase App",
      home: Employee(),
    );
  }
}

class Employee extends StatefulWidget {
  const Employee({super.key});

  @override
  State<Employee> createState() => _EmployeeState();
}

class _EmployeeState extends State<Employee> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Employee Info"),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
    );
  }
}
