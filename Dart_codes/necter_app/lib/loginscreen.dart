import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:necter_app/bottomnav.dart';
import 'package:necter_app/homescreen.dart';
import 'package:necter_app/signup_screen.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  void obscureText() {}
  bool isview = true;
  final TextEditingController emailcontroller = TextEditingController();

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
            Text("Loging",
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
            Text("Password",
                style: GoogleFonts.dmSans(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: const Color.fromRGBO(124, 124, 124, 1))),
            TextField(
              controller: passwordcontroller,
              obscureText: isview,
              decoration: InputDecoration(
                  suffixIcon: GestureDetector(
                      onTap: () {
                        isview = !isview;
                        setState(() {});
                      },
                      child: Icon(
                          isview ? Icons.visibility_off : Icons.visibility))),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Forgot Password?",
                    style: GoogleFonts.dmSans(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () async {
                if (emailcontroller.text.trim().isNotEmpty &&
                    passwordcontroller.text.trim().isNotEmpty) {
                  try {
                    UserCredential userCredential =
                        await firebaseAuth.signInWithEmailAndPassword(
                            email: emailcontroller.text,
                            password: passwordcontroller.text);

                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        backgroundColor: Colors.green,
                        content: Center(
                            child: Text("Login Successfully",
                                style: GoogleFonts.dmSans(
                                    fontSize: 18, color: Colors.white)))));

                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => const BottomNav(),
                      ),
                    );
                  } on FirebaseException catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        backgroundColor: Colors.red,
                        content: Center(
                            child: Text("$e",
                                style: GoogleFonts.dmSans(
                                    fontSize: 18, color: Colors.white)))));
                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      backgroundColor: Colors.red,
                      content: Center(
                          child: Text("Empty Fields",
                              style: GoogleFonts.dmSans(
                                  fontSize: 18, color: Colors.white)))));
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
                    child: Text("Log In",
                        style: GoogleFonts.dmSans(
                            fontSize: 18, color: Colors.white))),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don’t have an account? ",
                    style: GoogleFonts.dmSans(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    )),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const SignupScreen()));
                  },
                  child: Text("Singup",
                      style: GoogleFonts.dmSans(
                        fontSize: 18,
                        color: const Color.fromRGBO(83, 177, 117, 1),
                        fontWeight: FontWeight.w700,
                      )),
                )
              ],
            )
          ],
        ),
      ),
    ));
  }
}
