import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ice_cream/bottom_navigation.dart';
import 'package:ice_cream/login_screen.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController mobilecontroller = TextEditingController();

  final TextEditingController passwordcontroller = TextEditingController();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future<void> _signup() async {
    if (emailcontroller.text.trim().isNotEmpty &&
        mobilecontroller.text.trim().isNotEmpty &&
        passwordcontroller.text.trim().isNotEmpty) {
      try {
        UserCredential userCredential = await firebaseAuth
            .createUserWithEmailAndPassword(
              email: emailcontroller.text.trim(),
              password: passwordcontroller.text.trim(),
            );

        log("UserCredential: $userCredential");
        showSuccessDialog(context);

        // Clear input fields
        emailcontroller.clear();
        mobilecontroller.clear();
        passwordcontroller.clear();
      } on FirebaseAuthException catch (e) {
        String errorMessage;

        switch (e.code) {
          case 'email-already-in-use':
            errorMessage = 'The email is already registered.';
            break;
          case 'invalid-email':
            errorMessage = 'The email address is not valid.';
            break;
          case 'operation-not-allowed':
            errorMessage = 'Email/password accounts are not enabled.';
            break;
          case 'weak-password':
            errorMessage = 'The password is too weak.';
            break;
          default:
            errorMessage = 'An unexpected error occurred: ${e.message}';
        }

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            content: Text(
              errorMessage,
              style: GoogleFonts.inter(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ),
        );
      } catch (e) {
        // Generic catch block (network, platform exceptions, etc.)
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            content: Text(
              "Something went wrong: ${e.toString()}",
              style: GoogleFonts.inter(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Center(
            child: Text(
              "Please fill all fields",
              style: GoogleFonts.inter(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ),
        ),
      );
    }
  }

  void showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Icon(
                        Icons.cancel,
                        size: 30,
                        color: const Color.fromRGBO(138, 25, 214, 1),
                      ),
                    ),
                  ],
                ),
                Container(
                  // padding: EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: SvgPicture.asset(
                    "assets/svg/Vector.svg",
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Account Created!",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                SizedBox(height: 8),
                Text(
                  "Account Created Successfully",
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(height: 24),
                SizedBox(
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => const BottomNavigation(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(138, 25, 214, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 14),
                    ),
                    child: Text(
                      "Continue ",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset("assets/png/banner_login1 1.png", scale: 0.6),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 42),
                    Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: SvgPicture.asset(
                          "assets/svg/Icon.svg",
                          height: 40,
                        ),
                      ),
                    ),
                    SizedBox(height: 45),
                    Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: Text(
                        "Sorveteria",
                        style: GoogleFonts.inter(
                          fontSize: 28,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: 5),

                    Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: Text(
                        "Faca or login to access the area"
                        "\nSorveteria administration.",
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: 98),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(height: 300),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 620,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadiusDirectional.only(
                          topStart: Radius.circular(43),
                          topEnd: Radius.circular(43),
                        ),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Create Account",
                              style: GoogleFonts.sourceSans3(
                                fontSize: 29,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 20),
                            Container(
                              height: 58,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),

                                border: BoxBorder.all(
                                  color: Color.fromRGBO(226, 232, 240, 1),
                                ),
                              ),
                              child: TextField(
                                controller: emailcontroller,
                                decoration: InputDecoration(
                                  hintText: "Enter Your Email",
                                  hintStyle: GoogleFonts.inter(),

                                  prefixIcon: SvgPicture.asset(
                                    "assets/svg/fi_646094.svg",
                                    fit: BoxFit.scaleDown,
                                  ),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            Container(
                              height: 58,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),

                                border: BoxBorder.all(
                                  color: Color.fromRGBO(226, 232, 240, 1),
                                ),
                              ),
                              child: TextField(
                                controller: mobilecontroller,
                                decoration: InputDecoration(
                                  hintText: "Enter Your Mobile No",
                                  hintStyle: GoogleFonts.inter(),

                                  prefixIcon: Icon(
                                    Icons.call_outlined,
                                    color: const Color.fromRGBO(
                                      138,
                                      25,
                                      214,
                                      1,
                                    ),
                                  ),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            Container(
                              height: 58,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),

                                border: BoxBorder.all(
                                  color: Color.fromRGBO(226, 232, 240, 1),
                                ),
                              ),
                              child: TextField(
                                obscureText: true,
                                controller: passwordcontroller,
                                decoration: InputDecoration(
                                  prefixIcon: SvgPicture.asset(
                                    "assets/svg/fi_2889676.svg",
                                    fit: BoxFit.scaleDown,
                                  ),
                                  hintText: "Enter Your Password",

                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                            SizedBox(height: 20),

                            GestureDetector(
                              onTap: _signup,

                              child: Container(
                                height: 59,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(32),
                                  color: const Color.fromRGBO(138, 25, 214, 1),
                                ),
                                child: Center(
                                  child: Text(
                                    "Sign Up",
                                    style: GoogleFonts.inter(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            Align(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                onPressed: () {
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                      builder: (context) => const LoginScreen(),
                                    ),
                                  );
                                },
                                child: Text(
                                  "Already Register..!",
                                  style: GoogleFonts.inter(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: const Color.fromRGBO(
                                      138,
                                      25,
                                      214,
                                      1,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 40,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(32),
                              ),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset("assets/svg/Line 2.svg"),

                                    Text(
                                      " Or ",
                                      style: GoogleFonts.inter(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SvgPicture.asset("assets/svg/Line 2.svg"),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 10),

                            Container(
                              height: 59,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(32),
                                border: Border.all(
                                  color: Color.fromRGBO(203, 213, 225, 1),
                                ),
                              ),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset("assets/png/icon.png"),
                                    SizedBox(width: 10),
                                    Text(
                                      "Continue with Google",
                                      style: GoogleFonts.inter(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
