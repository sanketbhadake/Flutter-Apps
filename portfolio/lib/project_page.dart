import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProjectPage extends StatefulWidget {
  const ProjectPage({super.key});

  @override
  State<ProjectPage> createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
  final List<Map<String, dynamic>> projects = [
    {
      'title': 'Interactive Quize App',
      'description':
          'Bullt a moblie application for undertaking quizz with a clean and user- friendly interface. Result is displayed after every attempt of me questions and realtime marks are displayed for user to understand the progress.',

      'tech': ['Flutter', 'Dart'],
    },
    {
      'title': 'To-Do List App',
      'description':
          'Developed a simple and intuitive mobile application using Flutter for managing tasks. Features include adding, editing, and deleting tasks, with a user-friendly interface and persistent local data storage.',
      'tech': ['Flutter', 'Dart', 'SQF lite'],
    },
    {
      'title': 'Advanced To-Do List App',
      'description':
          'Designed and developed an enhanced task management app using Flutter, incorporating the Slidable widget for intuitive swipe actions like edit, delete.',

      'tech': ['Flutter', 'Dart', 'SQF lite'],
    },
    {
      'title': 'CakeCraft Customized Cake App',
      'description':
          'Developed a Flutter-based application allowing users to design custom cakes with an intuitive dragand-drop interface.Utilized Firebase for storing user preferences, onders, and real-time synchronization across devices.',
      'tech': [
        'Flutter',
        'Firebase',
        'Firebase Storage',
        'SQF Lite',
        'Animations',
      ],
    },
    {
      'title': 'News App',
      'description':
          'Developed a API Binding News app in Flutter . Features include a Splash Screen, Home Screen displaying dynamic data, Search Screen for filtering results, and a Detail Screen showing item-specific information.',
      'tech': ['Flutter', 'Dart', 'REST API', 'SQF Lite'],
    },
    {
      'title': 'Necter Grocery Shopping App',
      'description':
          'A simple e-commerce app for groceries with cart and checkout system.',
      'tech': ['Flutter', 'Dart', 'Responsive Ul'],
    },
    {
      'title': 'Ice Creame App',
      'description':
          'A beautiful Ice Creame App UI with Smooth navigation with user authentication.',
      'tech': ['Flutter', 'Dart', 'Firebase Authentication'],
    },
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
          "Projects",
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
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: projects.length,
              padding: const EdgeInsets.all(16),
              itemBuilder: (context, index) {
                final project = projects[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
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
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.white,
                    ),

                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${project['title']}",
                            style: GoogleFonts.poppins(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "${project['description']}",
                            style: GoogleFonts.poppins(fontSize: 14),
                          ),
                          const SizedBox(height: 12),
                          Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children: List<Widget>.from(
                              project['tech'].map(
                                (tech) => Chip(
                                  label: Text(tech),
                                  backgroundColor: Color.fromRGBO(
                                    83,
                                    177,
                                    117,
                                    0.463,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
