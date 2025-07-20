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
  dynamic maxSalary;
  Map<String, dynamic>? empMaxSalaryDetails;
  TextEditingController empNameController = TextEditingController();
  TextEditingController empSalController = TextEditingController();
  TextEditingController devTypeController = TextEditingController();

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
              controller: empNameController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  hintText: "Enter Employee Name"),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: empSalController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  hintText: "Enter Employee Salary"),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: devTypeController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  hintText: "Enter Developer Type"),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Map<String, dynamic> data = {
                  "EmpName": empNameController.text,
                  "EmpSal": int.parse(empSalController.text),
                  "DevType": devTypeController.text,
                };

                FirebaseFirestore.instance.collection("Employeeinfo").add(data);
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
                      .get();

                  int? maxSalaryValue;
                  Map<String, dynamic>? maxSalaryDetails;

                  for (var val in response.docs) {
                    int salary = val["EmpSal"];
                    if (maxSalaryValue == null || salary > maxSalaryValue) {
                      maxSalaryValue = salary;
                      maxSalaryDetails = val.data() as Map<String, dynamic>;
                    }
                  }

                  setState(() {
                    maxSalary = maxSalaryValue;
                    empMaxSalaryDetails = maxSalaryDetails;
                  });
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
            const Text(
              "Maximum Salary of Employee:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Container(
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color.fromARGB(194, 130, 128, 125),
                borderRadius: BorderRadius.circular(20),
              ),
              child: empMaxSalaryDetails == null
                  ? const Center(
                      child: Text(
                        "No data available",
                        style: TextStyle(fontSize: 16),
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Employee Name: ${empMaxSalaryDetails!['EmpName']}",
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Employee Salary: \$${empMaxSalaryDetails!['EmpSal']}",
                            style: const TextStyle(fontSize: 16),
                          ),
                          Text(
                            "Developer Type: ${empMaxSalaryDetails!['DevType']}",
                            style: const TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
