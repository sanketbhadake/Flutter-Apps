import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:student_info/get_data.dart';

class Employee extends StatefulWidget {
  const Employee({super.key});

  @override
  State<Employee> createState() => _EmployeeState();
}

class _EmployeeState extends State<Employee> {
  TextEditingController nameController = TextEditingController();
  TextEditingController collegeController = TextEditingController();
  TextEditingController courseController = TextEditingController();
  Map coursedata = {};
  bool isoffline = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Student Info",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    hintText: "Enter student name"),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: collegeController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    hintText: "Enter College name"),
              ),
              const SizedBox(height: 20),
              Expanded(flex: 0, child: Text("Enrolled Courses : $coursedata")),
              const SizedBox(height: 20),
              TextField(
                controller: courseController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    hintText: "Enter the course"),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        isoffline = true;
                        setState(() {});
                      },
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(
                            isoffline == true ? Colors.blue : Colors.white),
                      ),
                      child: const Text(
                        "Offline",
                        style: TextStyle(color: Colors.black),
                      )),
                  ElevatedButton(
                      onPressed: () {
                        isoffline = false;
                        setState(() {});
                      },
                      style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(
                              isoffline == false ? Colors.blue : Colors.white)),
                      child: const Text(
                        "Online",
                        style: TextStyle(color: Colors.black),
                      )),
                ],
              ),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                    onPressed: () {
                      if (courseController.text.isNotEmpty) {
                        String mode = '';
                        if (isoffline) {
                          mode = "Offine";
                        } else {
                          mode = "Online";
                        }
                        coursedata[courseController.text] = mode;
                        courseController.clear();
                        setState(() {});
                      }
                    },
                    style: const ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(Colors.blue)),
                    child: const Text(
                      "Add course",
                      style: TextStyle(color: Colors.white),
                    )),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: () async {
                        if (nameController.text.trim().isNotEmpty &&
                            collegeController.text.trim().isNotEmpty &&
                            coursedata.isNotEmpty) {
                          Map<String, dynamic> data = {
                            "Student Name": nameController.text,
                            "college Name": collegeController.text,
                            "Enrolled Course": coursedata,
                          };
                          DocumentReference docref = await FirebaseFirestore
                              .instance
                              .collection("student_Info")
                              .add(data);
                          nameController.clear();
                          collegeController.clear();
                          coursedata = {};
                          setState(() {});
                          log("Docref: $docref");
                        }
                      },
                      style: const ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(Colors.blue)),
                      child: const Text(
                        "Add data",
                        style: TextStyle(color: Colors.white),
                      )),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const GetData()));
                      },
                      style:const ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(Colors.blue)),
                      child: const Text(
                        "Get data",
                        style: TextStyle(color: Colors.white),
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
