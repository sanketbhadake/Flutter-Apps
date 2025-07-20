 
 

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/BottomNav.dart';
//import 'package:project/BottomNav.dart';
import 'package:project/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
 

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(debugShowCheckedModeBanner: false, home: SignUp());
  }
}

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class CustomSnackbar {
  static showCustomSnackbar(
      {required String message, required BuildContext context}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        message,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 18,
        ),
      ),
      backgroundColor: Colors.white,
    ));
  }
}

class _SignUpState extends State<SignUp> {
  String Name = " ";
  String MobileNo = "";
  String imageUrl = "";
  String DOB = "";
  final TextEditingController _fullnamecontroller = TextEditingController();
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _MobileNocontrolller = TextEditingController();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // Future<void> receiverData() async {
  //   log("Recieve data");
  //   DocumentSnapshot<Map<String, dynamic>> response = await FirebaseFirestore
  //       .instance
  //       .collection('ProfilePage')
  //       .doc(Sessiondata.emailId)
  //       .get();

  //   Name = response['Name'];
  //   MobileNo = response['MobileNo'];
  //   imageUrl = response['imageUrl'];
  //   DOB = response['DOB'];

  //   setState(() {});

  //   log("data recieved");
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 200),
          SvgPicture.asset(
            "assets/image 4.png",
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              "Sign Up",
              style: GoogleFonts.quicksand(
                  fontSize: 28, fontWeight: FontWeight.w500),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: TextField(
              controller: _fullnamecontroller,
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                labelText: "Full Name",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: TextField(
              controller: _emailcontroller,
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                labelText: "Email",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: TextField(
              controller: _passwordcontroller,
              decoration: InputDecoration(
                fillColor: const Color.fromRGBO(254, 114, 76, 1),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                labelText: "Password",
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () async {
              // Perform submit actions here

              await FirebaseFirestore.instance
                  .collection("ProfilePage")
                  .doc(_emailcontroller.text)
                  .set({
                'Name': _fullnamecontroller.text.trim(),
                'Email': _emailcontroller.text.trim(),
                'DOB': _dateController.text.trim(),
                'MobileNo': _MobileNocontrolller.text.trim(),
                'imageUrl': imageUrl,
              },
              );

              if (_emailcontroller.text.trim().isNotEmpty &&
                  _passwordcontroller.text.trim().isNotEmpty) {
                try {
                  UserCredential userCredential =
                      await _firebaseAuth.createUserWithEmailAndPassword(
                    email: _emailcontroller.text.trim(),
                    password: _passwordcontroller.text.trim(),
                  );

                  CustomSnackbar.showCustomSnackbar(
                      message: "User Registered Successfully",
                      context: context);

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const cakeProject()));
                } on FirebaseAuthException catch (error) {
                  CustomSnackbar.showCustomSnackbar(
                      message: error.message!, context: context);
                }
              } else {
                CustomSnackbar.showCustomSnackbar(
                    message: "Please enter valid fields", context: context);
              }
            },
            child: Container(
              margin: const EdgeInsets.all(15),
              height: 60,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(254, 114, 76, 1),
                  borderRadius: BorderRadius.circular(25)),
              child: Center(
                  child: Text(
                "Sign Up",
                style: GoogleFonts.inter(
                    fontSize: 22,
                    color: const Color.fromRGBO(255, 255, 255, 1)),
              )),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                  child: Text(
                "I Have Already Account ?",
                style: GoogleFonts.inter(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              )),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Login()));
                },
                child: Text(
                  " Log In",
                  style: GoogleFonts.inter(
                    fontSize: 20,
                    color: const Color.fromRGBO(254, 114, 76, 1),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/Line 72.png"),
              Text(
                "Sign in with",
                style: GoogleFonts.inter(
                    fontSize: 16, color: const Color.fromRGBO(80, 80, 80, 100)),
              ),
              Image.asset("assets/Line 72.png"),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(235, 238, 243, 100),
                  borderRadius: BorderRadius.circular(30)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/google.png"),
                  Text(
                    "Log In With Goggle",
                    style: GoogleFonts.inter(fontSize: 20, color: Colors.black),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
