import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'signup.dart';

class Signupscreen3 extends StatefulWidget {
  const Signupscreen3({super.key});

  @override
  State<Signupscreen3> createState() => _Signupscreen3State();
}

List userdata = [];
Future<void> getdata() async {
  QuerySnapshot response =
      await FirebaseFirestore.instance.collection("userInfo").get();

  for (var doc in response.docs) {
    userdata.add(
        {'useremail': doc['useremail'], 'userpassword': doc['userpassword']});
  }
}

class _Signupscreen3State extends State<Signupscreen3> {
  void initState() {
    super.initState();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Geting data firebase"),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              child: ListView.builder(
                  itemCount: userdata.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) => Container(
                        child: Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Email: ${userdata[index]['useremail']}",
                                style: TextStyle(fontSize: 20),
                              ),
                              Text(
                                "Email: ${userdata[index]['userpassword']}",
                                style: TextStyle(fontSize: 20),
                              )
                            ],
                          ),
                        ),
                      )),

              // Text("Email: ${userdata[0]['useremail']}"),
              // Text("Email: ${userdata[0]['userpassword']}")
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () {
                  // Navigator.of(context).push(
                  //     MaterialPageRoute(builder: (context) => SignupScreen));
                },
                child: Text("Logout"))
          ],
        ),
      ),
    );
  }
}
