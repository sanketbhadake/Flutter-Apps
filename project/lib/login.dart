 
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
 
import 'package:google_fonts/google_fonts.dart';
import 'package:project/BottomNav.dart';
import 'package:project/forgotpass.dart';
 
import 'package:project/sessionData.dart';
//import 'package:project/homePage.dart';
//import 'package:firebase_auth/firebase_auth.dart';
//import 'dart:developer';
import 'Signup.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  String? userInfo = "";
  void _login() {
    String email = _emailController.text.trim();
    String password = _passwordController.text;

    // Validation
    if (email.isEmpty || password.isEmpty) {
      _showError("Please fill all fields.");
    } else if (!_validateEmailOrPhone(email)) {
      _showError("Invalid email or phone number.");
    } else if (password.length < 6) {
      _showError("Password must be at least 6 characters long.");
    } else {
      //successful login and redirect
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const cakeProject(),
        ),
      );
    }
  }

  bool _validateEmailOrPhone(String input) {
    // Simple regex for email/phone validation
    String emailRege = r"^[a-zA-Z0-9._]+@[a-zA-Z]+\.[a-zA-Z]+";
    String phoneRege = r"^\d{10}$";
    return RegExp(emailRege).hasMatch(input) ||
        RegExp(phoneRege).hasMatch(input);
  }

  void _showError(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Error"),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }

  bool _ispassvisible = true;
  bool ison = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset("assets/image 4.png"),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                "Log In",
                style: GoogleFonts.quicksand(
                    fontSize: 28, fontWeight: FontWeight.w500),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  suffixIcon: const Icon(Icons.person),
                  hintText: "Email",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: TextField(
                controller: _passwordController,
                obscureText: _ispassvisible,
                decoration: InputDecoration(
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        _ispassvisible = !_ispassvisible;
                      });
                    },

                    child: Icon(
                      _ispassvisible ? Icons.visibility_off : Icons.visibility,
                    ),
                    // child: const Icon(Icons.remove_red_eye_outlined)
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  hintText: "Password",
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ForgotPassword()));
                    },
                    child: Text(
                      "Forgot Password",
                      style: GoogleFonts.quicksand(
                          fontSize: 18,
                          color: const Color.fromRGBO(80, 80, 80, 100)),
                    ),
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: () async {
                if (_emailController.text.trim().isNotEmpty &&
                    _passwordController.text.trim().isNotEmpty) {
                  try {
                    UserCredential userCredential =
                        await _firebaseAuth.signInWithEmailAndPassword(
                            email: _emailController.text,
                            password: _passwordController.text);

                    await Sessiondata.storeSessionData(
                      loginData: true,
                      emailId: _emailController.text.trim(),
                    );

                    await Sessiondata.storeSessionData(
                        loginData: true, emailId: _emailController.text.trim());

                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) {
                          return const cakeProject();
                        },
                      ),
                    );
                  } on FirebaseAuthException catch (error) {
                    CustomSnackbar.showCustomSnackbar(
                      message: error.code,
                      context: context,
                    );
                  }
                }
              },
              child: Container(
                margin: const EdgeInsets.only(left: 15, right: 15),
                height: 60,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(254, 114, 76, 1),
                    borderRadius: BorderRadius.circular(25)),
                child: Center(
                    child: Text(
                  "Login",
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
                  "Don’t Have Account ?",
                  style: GoogleFonts.inter(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                )),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MyWidget()));
                  },
                  child: Text(
                    " Sign Up",
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
                      fontSize: 16,
                      color: const Color.fromRGBO(80, 80, 80, 100)),
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
                      "Log In With Google",
                      style:
                          GoogleFonts.inter(fontSize: 20, color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
