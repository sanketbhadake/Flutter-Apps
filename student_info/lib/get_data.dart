import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetData extends StatefulWidget {
  const GetData({super.key});

  @override
  State<GetData> createState() => _GetDataState();
}

class _GetDataState extends State<GetData> {
  List studentdata = [];

  void initstate() {
    super.initState();
    log("in init");
    fetchdata();
  }

  void fetchdata() async {
    QuerySnapshot response =
        await FirebaseFirestore.instance.collection("student_Info").get();

    studentdata = response.docs;
    log("${response.docs}");
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Get data",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      body: ListView.builder(
          itemCount: studentdata.length,
          shrinkWrap: true,
          itemBuilder: (context, index) => Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(studentdata[index]['Student Name']),
                    Text(studentdata[index]['college Name']),
                    Text("Courses: ${studentdata[index]['Enrolled Course']}"),
                  ],
                ),
              ),),
    );
  }
}
