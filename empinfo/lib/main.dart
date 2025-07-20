

import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyBrWKdQ4Ts7v7qONUVyXhSC2_kZEqcy-qU",
        appId: "1:366687694632:android:3959d3ed64cde9eb996a1d",
        messagingSenderId: "366687694632",
        projectId: "empinfo-2b951"),
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

class Employee extends StatefulWidget {
  const Employee({super.key});

  @override
  State<Employee> createState() => _EmployeeState();
}

class _EmployeeState extends State<Employee> {
  TextEditingController EmpNameController = TextEditingController();
  TextEditingController EmpsalController = TextEditingController();
  TextEditingController DevtypeController = TextEditingController();
  Map<String, dynamic>? empmaxsalary;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Employee Info"),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            TextField(
              controller: EmpNameController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  hintText: "Enter Employee name"),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: EmpsalController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  hintText: "Enter Employee Salary"),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: DevtypeController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  hintText: "Enter Developer type"),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Map<String, dynamic> data = {
                  "Empname": EmpNameController.text,
                  "Empsal": double.parse(EmpsalController.text),
                  "Devtype": DevtypeController.text,
                };

                FirebaseFirestore.instance.collection("Employeeinfo").add(data);

                EmpNameController.clear();
                EmpsalController.clear();
                DevtypeController.clear();
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Data Added successfully")));
              },
              child: Container(
                margin: const EdgeInsets.all(20),
                height: 60,
                width: 300,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Center(
                  child: Text(
                    "ADD DATA",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () async {
                try {
                  QuerySnapshot response = await FirebaseFirestore.instance
                      .collection("Employeeinfo")
                      .orderBy("Empsal", descending: true)
                      .limit(1)
                      .get();

                  if (response.docs.isNotEmpty) {
                    Map<String, dynamic> employeeDetails =
                        response.docs.first.data() as Map<String, dynamic>;

                    setState(() {
                      empmaxsalary = employeeDetails;
                    });
                  } else {
                    setState(() {
                      empmaxsalary = null;
                    });
                  }
                } catch (e) {
                  log("Error fetching max salary: $e");
                }
              },
              child: Container(
                margin: const EdgeInsets.all(20),
                height: 60,
                width: 300,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Center(
                  child: Text(
                    "GET DATA",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Maximum Salary of Employee:",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: 120,
              width: 400,
              decoration: BoxDecoration(
                color: const Color.fromARGB(51, 130, 128, 125),
                borderRadius: BorderRadius.circular(20),
              ),
              child: empmaxsalary != null
                  ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Employee Name: ${empmaxsalary!['Empname']}",
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                          Text(
                            "Employee Salary: ${empmaxsalary!['Empsal']}",
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                          Text(
                            "Developer Type: ${empmaxsalary!['Devtype']}",
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    )
                  : const Center(
                      child: Text("No Data Available"),
                    ),
            )
          ],
        ),
      ),
    );
  }
}
