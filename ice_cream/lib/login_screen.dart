import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ice_cream/bottom_navigation.dart';
import 'package:ice_cream/create_account.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  Future<void> loginLogic() async {
    if (_emailcontroller.text.trim().isNotEmpty &&
        _passwordcontroller.text.trim().isNotEmpty) {
      try {
        UserCredential userCredential = await firebaseAuth
            .signInWithEmailAndPassword(
              email: _emailcontroller.text.trim(),
              password: _passwordcontroller.text.trim(),
            );

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: const Color.fromRGBO(138, 25, 214, 1),
            content: Center(
              child: Text(
                "Login Successfully",
                style: GoogleFonts.dmSans(fontSize: 18, color: Colors.white),
              ),
            ),
          ),
        );

        log("userCredential: $userCredential");

        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const BottomNavigation()),
        );
      } on FirebaseAuthException catch (e) {
        String errorMessage = '';

        switch (e.code) {
          case 'user-not-found':
            errorMessage = 'No user found for that email.';
            break;
          case 'wrong-password':
            errorMessage = 'Wrong password provided.';
            break;
          case 'invalid-email':
            errorMessage = 'The email address is invalid.';
            break;
          case 'user-disabled':
            errorMessage = 'This user has been disabled.';
            break;
          default:
            errorMessage = 'Please Register Account';
        }

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            content: Center(
              child: Text(
                errorMessage,
                style: GoogleFonts.dmSans(fontSize: 18, color: Colors.white),
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
              "Empty Fields",
              style: GoogleFonts.inter(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        ),
      );
    }
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
                      child: SvgPicture.asset(
                        "assets/svg/Icon.svg",
                        height: 40,
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
                      height: MediaQuery.of(context).size.height,
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
                              "Login",
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
                                controller: _emailcontroller,
                                decoration: InputDecoration(
                                  hintText: "admin@email.com",
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
                                controller: _passwordcontroller,
                                obscureText: true,
                                decoration: InputDecoration(
                                  prefixIcon: SvgPicture.asset(
                                    "assets/svg/fi_2889676.svg",
                                    fit: BoxFit.scaleDown,
                                  ),
                                  hintText: "**** ",
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                onPressed: () {},
                                child: Text(
                                  "Forget Password?",
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
                            GestureDetector(
                              onTap: loginLogic,
                              child: Container(
                                height: 59,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(32),
                                  color: const Color.fromRGBO(138, 25, 214, 1),
                                ),
                                child: Center(
                                  child: Text(
                                    "Log in",
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
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const CreateAccount(),
                                    ),
                                  );
                                },
                                child: Text(
                                  "Create Account",
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
                            SizedBox(height: 8),

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
                                    SizedBox(width: 5),
                                    Text(
                                      "Google",
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
