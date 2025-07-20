import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inherited_state_management/controller.dart';
import 'package:inherited_state_management/signup_screen2.dart';
import 'package:firebase_auth/firebase_auth.dart';

final TextEditingController passwordcontroller = TextEditingController();

final TextEditingController emailcontroller = TextEditingController();

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Signup"),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Email"),
              TextField(
                controller: emailcontroller,
                decoration: InputDecoration(border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 30,
              ),
              Text("password"),
              TextField(
                controller: passwordcontroller,
                decoration: InputDecoration(border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 30,
              ),
              Center(
                child: ElevatedButton(
                    onPressed: () async {
                      Map<String,dynamic> data = {
                        "useremail":emailcontroller.text,
                        "userpassword":passwordcontroller.text


                      };
                     await FirebaseFirestore.instance
                          .collection("userInfo")
                          .add(data);

                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const SignupScreen2()));
                    },
                    child: const Text("Signup")),
              )
            ],
          ),
        ),
      ),
    );
  }
}
