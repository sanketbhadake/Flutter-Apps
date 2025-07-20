import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inherited_state_management/controller.dart';
import 'package:inherited_state_management/signup.dart';
import 'package:inherited_state_management/signupscreen3.dart';

class SignupScreen2 extends StatefulWidget {
  const SignupScreen2({super.key});

  @override
  State<SignupScreen2> createState() => _SignupScreen2State();
}

class _SignupScreen2State extends State<SignupScreen2> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Signup.of(context).email = emailcontroller.text;
    Signup.of(context).password = passwordcontroller.text;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Geting data inherited"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "UserEmail :${Signup.of(context).email} ",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Text(
              "UserEmail :${Signup.of(context).password} ",
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
          QuerySnapshot response =
      await FirebaseFirestore.instance.collection("userInfo").get();

  for (var doc in response.docs) {
    userdata.add({
      'useremail': doc['useremail'],
      'userpassword':doc['userpassword']
    });
  }
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => const Signupscreen3()));
        },
        backgroundColor: Colors.blue,
        child: const Text("NEXT"),
      ),
    );
  }
}
