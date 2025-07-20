import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/browinie.dart';
import 'package:project/cheesecake.dart';
import 'package:project/cookies.dart';
import 'package:project/cupcake.dart';

import 'package:project/pastries.dart';
import 'package:project/teacake.dart';

class Category extends StatefulWidget {
  const Category({super.key});

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      
        title: Text(
          "Category",
          style: GoogleFonts.inter(fontSize: 25),
        ),
        shape: const Border(
            bottom: BorderSide(
          color: Color.fromARGB(255, 230, 228, 228),
          width: 1,
        )),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CookiesPage()));
                    },
                    child: Container(
                      height: 170,
                      width: 150,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromARGB(84, 0, 0, 0),
                            spreadRadius: 0,
                            blurRadius: 10,
                            offset: Offset(0, 3),
                          ),
                        ],
                        //color: Colors.amber,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 135,
                            width: 150,
                            child: Image.asset(
                              "assets/cookies/2.jpeg",
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Center(
                              child: Text(
                                "Cookies",
                                style: GoogleFonts.inter(fontSize: 20),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CupcakePage()));
                    },
                    child: Container(
                      height: 170,
                      width: 150,
                      decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromARGB(84, 0, 0, 0),
                            spreadRadius: 0,
                            blurRadius: 10,
                            offset: Offset(0, 3),
                          ),
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 135,
                            width: 150,
                            child: Image.asset(
                              "assets/cupcake1.jpg",
                              fit: BoxFit.cover,
                            ),
                          ),
                          Center(
                            child: Text(
                              "Cupcake",
                              style: GoogleFonts.inter(fontSize: 20),
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
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PastriesPage()));
                    },
                    child: Container(
                      height: 170,
                      width: 150,
                      decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromARGB(84, 0, 0, 0),
                            spreadRadius: 0,
                            blurRadius: 10,
                            offset: Offset(0, 3),
                          ),
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: Column(children: [
                        SizedBox(
                          height: 135,
                          width: 150,
                          child: Image.asset(
                            "assets/pastries/4.png",
                            fit: BoxFit.fill,
                          ),
                        ),
                        Center(
                          child: Text(
                            "Pastries",
                            style: GoogleFonts.inter(fontSize: 20),
                          ),
                        ),
                      ]),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const BrowiniePage()));
                    },
                    child: Container(
                      height: 170,
                      width: 150,
                      decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromARGB(84, 0, 0, 0),
                            spreadRadius: 0,
                            blurRadius: 10,
                            offset: Offset(0, 3),
                          ),
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 135,
                            width: 150,
                            child: Image.asset(
                              "assets/Brownie.png",
                              fit: BoxFit.fill,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Center(
                              child: Text(
                                "Browinie",
                                style: GoogleFonts.inter(fontSize: 20),
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
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Cheesecakepage()));
                    },
                    child: Container(
                      height: 170,
                      width: 150,
                      decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromARGB(84, 0, 0, 0),
                            spreadRadius: 0,
                            blurRadius: 10,
                            offset: Offset(0, 3),
                          ),
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 135,
                            width: 150,
                            child: Image.asset(
                              "assets/cheesecake/2.jpg",
                              fit: BoxFit.fill,
                            ),
                          ),
                          Center(
                            child: Text(
                              "CheeseCakes",
                              style: GoogleFonts.inter(fontSize: 20),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const TeacakePage()));
                    },
                    child: Container(
                      height: 170,
                      width: 150,
                      decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromARGB(84, 0, 0, 0),
                            spreadRadius: 0,
                            blurRadius: 10,
                            offset: Offset(0, 3),
                          ),
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 135,
                            width: 150,
                            child: Image.asset(
                              "assets/tea cake/1.jpg",
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Center(
                              child: Text(
                                "Tea Cake",
                                style: GoogleFonts.inter(fontSize: 20),
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
    );
  }
}
