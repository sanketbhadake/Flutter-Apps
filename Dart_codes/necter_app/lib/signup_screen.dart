import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:necter_app/loginscreen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController mobilecontroller = TextEditingController();

  final TextEditingController passwordcontroller = TextEditingController();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(25.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 60,
            ),
            Center(
              child: SizedBox(
                child: SvgPicture.asset("assets/svg/carrot.svg"),
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            Text("Signup",
                style: GoogleFonts.dmSans(
                    fontSize: 28, fontWeight: FontWeight.w700)),
            Text(
              "Enter your emails and password",
              style: GoogleFonts.dmSans(
                fontSize: 18,
                color: const Color.fromRGBO(124, 124, 124, 1),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Text(
              "Email",
              style: GoogleFonts.dmSans(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: const Color.fromRGBO(124, 124, 124, 1),
              ),
            ),
            TextField(
              controller: emailcontroller,
            ),
            Text(
              "Mobile Number",
              style: GoogleFonts.dmSans(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: const Color.fromRGBO(124, 124, 124, 1),
              ),
            ),
            TextField(
              controller: mobilecontroller,
            ),
            Text("Password",
                style: GoogleFonts.dmSans(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: const Color.fromRGBO(124, 124, 124, 1))),
            TextField(
              controller: passwordcontroller,
            ),
            const SizedBox(
              height: 25,
            ),
            GestureDetector(
              onTap: () async {
                if (emailcontroller.text.trim().isNotEmpty &&
                    mobilecontroller.text.trim().isNotEmpty &&
                    passwordcontroller.text.trim().isNotEmpty) {
                  try {
                    UserCredential userCredential =
                        await firebaseAuth.createUserWithEmailAndPassword(
                            email: emailcontroller.text.trim(),
                            password: passwordcontroller.text.trim());
                    log("Usercredential: $userCredential");

                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        backgroundColor: Colors.green,
                        content: Center(
                            child: Text("Register Successfully",
                                style: GoogleFonts.dmSans(
                                    fontSize: 18, color: Colors.white)))));
                  } on FirebaseAuthException catch (e) {
                    log("$e");
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        backgroundColor: Colors.red,
                        content: Text("$e",
                            style: GoogleFonts.dmSans(
                                fontSize: 18, color: Colors.white))));
                  }
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const Loginscreen(),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      backgroundColor: Colors.red,
                      content: Center(
                        child: Text("Invalid Data",
                            style: GoogleFonts.dmSans(
                                fontSize: 18, color: Colors.white)),
                      )));
                }
              },
              child: Container(
                height: 68,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromRGBO(83, 177, 117, 1),
                ),
                child: Center(
                    child: Text("Sign up",
                        style: GoogleFonts.dmSans(
                            fontSize: 18, color: Colors.white))),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    ));
  }
}
