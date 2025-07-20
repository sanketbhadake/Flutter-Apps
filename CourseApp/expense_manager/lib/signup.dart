import 'package:expense_manager/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(42),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 100,
              ),
              Center(child: SvgPicture.asset("assets/svg/homescreen.svg")),
              const SizedBox(
                height: 40,
              ),
              Text(
                "Create your Account",
                style: GoogleFonts.poppins(
                    fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 55,
                width: 300,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(255, 255, 255, 1),
                  boxShadow: const [
                    BoxShadow(
                        blurRadius: 10,
                        offset: Offset(0, 3),
                        spreadRadius: 0,
                        color: Color.fromRGBO(0, 0, 0, 0.15)),
                  ],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: "  Name")),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 55,
                width: 300,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(255, 255, 255, 1),
                  boxShadow: const [
                    BoxShadow(
                        blurRadius: 10,
                        offset: Offset(0, 3),
                        spreadRadius: 0,
                        color: Color.fromRGBO(0, 0, 0, 0.15)),
                  ],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "  Username",
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 55,
                width: 300,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(255, 255, 255, 1),
                  boxShadow: const [
                    BoxShadow(
                        blurRadius: 10,
                        offset: Offset(0, 3),
                        spreadRadius: 0,
                        color: Color.fromRGBO(0, 0, 0, 0.15)),
                  ],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: "  Password")),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 55,
                width: 300,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(255, 255, 255, 1),
                  boxShadow: const [
                    BoxShadow(
                        blurRadius: 10,
                        offset: Offset(0, 3),
                        spreadRadius: 0,
                        color: Color.fromRGBO(0, 0, 0, 0.15)),
                  ],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "  Confirm Password",
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const Homepage(),
                    ),
                  );
                },
                child: Container(
                  height: 50,
                  width: 450,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(14, 161, 125, 1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      "Sign In",
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
