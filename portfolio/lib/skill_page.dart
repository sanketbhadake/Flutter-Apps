import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SkillPage extends StatefulWidget {
  const SkillPage({super.key});

  @override
  State<SkillPage> createState() => _SkillPageState();
}

class _SkillPageState extends State<SkillPage> {
  List skilllist = [
    {
      "title": "Flutter & Dart",
      "desc":
          "Experienced in building cross-platform apps with Flutter and Dart, using state management solutions like Provider and Riverpod.",
    },
    {
      "title": "Firebase & Cloud Services",
      "desc":
          "Proficient in Firebase Authentication, Firestore, Cloud Functions, and real-time database integration for scalable apps.",
    },
    {
      "title": "Java & OOP",
      "desc":
          "Strong understanding of Object-Oriented Programming concepts and Java development for backend and Android applications",
    },
    {"title": "Languages", "desc": "▪️Hindi \n▪️English \n▪️Marathi"},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(Icons.arrow_back_ios_new, color: Colors.white),
        ),
        backgroundColor: Color.fromRGBO(83, 177, 117, 1),
        title: Text(
          "Skills",
          style: GoogleFonts.poppins(
            fontSize: 25,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemCount: skilllist.length,
              shrinkWrap: true,

              itemBuilder: (Context, index) => Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 30,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        spreadRadius: 1,
                        blurRadius: 2,
                        offset: Offset(0, 2),
                      ),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          skilllist[index]["title"],
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          skilllist[index]["desc"],
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
