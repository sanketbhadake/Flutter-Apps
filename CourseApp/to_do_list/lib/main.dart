import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

void main() async {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Todolist(),
    );
  }
}

class Todolist extends StatefulWidget {
  const Todolist({super.key});

  @override
  State<Todolist> createState() => _TodolistState();
}

class _TodolistState extends State<Todolist> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  late Database _database;
  List<Map<String, dynamic>> alldata = [];
  @override
  void initState() {
    super.initState();
    initializeDatabase();
    log("In the init state");
  }

  Future<void> initializeDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'todolists.db');

    _database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE Todoitems (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT NOT NULL,
            description TEXT NOT NULL,
            date TEXT NOT NULL
          )
        ''');
        log("Table created successfully.");
      },
    );

    fetchData();
  }

  Future<void> fetchData() async {
    alldata = await _database.query('Todoitems');
    log('Fetched Data: $alldata');
    setState(() {}); // Update the UI after fetching data
  }

  Future<void> insertItem(Map<String, dynamic> item) async {
    await _database.insert(
      'Todoitems',
      item,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    fetchData();
  }

  Future<void> deleteItem(int id) async {
    await _database.delete(
      'Todoitems',
      where: 'id = ?',
      whereArgs: [id],
    );
    fetchData();
  }

  Future<void> updateItem(
      int id, String title, String description, String date) async {
    await _database.update(
      'Todoitems', // Table name
      {
        'title': title, // Updated title value
        'description': description, // Updated description value
        'date': date, // Updated date value
      },
      where: 'id = ?', // Where clause to identify the record
      whereArgs: [id], // Arguments for the where clause
    );
    fetchData();
  }

  void onUpdateButtonPressed(Map<String, dynamic> todoItem) {
    updateItem(
      todoItem['id'], // Pass the id of the task to be updated
      titleController.text, // New title value from controller
      descriptionController.text, // New description value from controller
      dateController.text, // New date value from controller
    ).then((_) {
      Navigator.of(context as BuildContext).pop();
      clearController();
    });
  }

  void clearControllers() {
    titleController.clear();
    descriptionController.clear();
    dateController.clear();
  }

  
void showbottomsheet(BuildContext context, bool doedit,
    [Map<String, dynamic>? todoItem]) {
  if (doedit && todoItem != null) {
    titleController.text = todoItem['title'];
    descriptionController.text = todoItem['description'];
    dateController.text = todoItem['date'];
  }

  showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    builder: (context) {
      return Padding(
        padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            top: 12.0,
            right: 12.0,
            left: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Text(
                doedit ? "Edit To-Do" : "Create To-Do",
                style: GoogleFonts.quicksand(
                    fontSize: 22, fontWeight: FontWeight.w600),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15),
              child: Text("Title",
                  style: TextStyle(color: Color.fromRGBO(0, 139, 148, 1))),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 15,
                right: 15,
                bottom: 15,
              ),
              child: TextField(
                controller: titleController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    fillColor: Color.fromRGBO(0, 139, 148, 1)),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15),
              child: Text("Description",
                  style: TextStyle(color: Color.fromRGBO(0, 139, 148, 1))),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
              child: TextField(
                controller: descriptionController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15),
              child: Text(
                "Date",
                style: TextStyle(color: Color.fromRGBO(0, 139, 148, 1)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
              child: TextField(
                controller: dateController,
                decoration: const InputDecoration(
                  suffixIcon: Icon(
                    Icons.calendar_month_outlined,
                    color: Color.fromRGBO(0, 139, 148, 1),
                  ),
                  border: OutlineInputBorder(),
                ),
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                      context: context,
                      firstDate: DateTime(2024),
                      lastDate: DateTime(2026));
                  if (pickedDate != null) {
                    String formattedDate =
                        DateFormat.yMMMd().format(pickedDate);
                    dateController.text = formattedDate;
                  }
                },
              ),
            ),
            GestureDetector(
              onTap: () async {
                if (titleController.text.isNotEmpty &&
                    descriptionController.text.isNotEmpty &&
                    dateController.text.isNotEmpty) {
                  if (doedit && todoItem != null) {
                    // Perform update
                    await updateItem(
                      todoItem['id'],
                      titleController.text,
                      descriptionController.text,
                      dateController.text,
                    );
                  } else {
                    // Perform insert
                    await insertItem({
                      'title': titleController.text,
                      'description': descriptionController.text,
                      'date': dateController.text,
                    });
                  }
                  log(doedit ? "Data updated" : "Data inserted");
                  Navigator.of(context).pop();
                  clearControllers();
                }
              },
              child: Container(
                margin: const EdgeInsets.all(15),
                height: 60,
                width: 400,
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(0, 139, 148, 1),
                    borderRadius: BorderRadius.circular(15)),
                child: const Center(
                  child: Padding(
                    padding: EdgeInsets.only(left: 15, right: 15),
                    child: Text("Submit",
                        style: TextStyle(fontSize: 20, color: Colors.white)),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}

  List colorlist = [
    const Color.fromRGBO(250, 232, 232, 1),
    const Color.fromRGBO(232, 237, 250, 1),
    const Color.fromRGBO(250, 249, 232, 1),
    const Color.fromRGBO(250, 232, 250, 1),
  ];

  void clearController() {
    titleController.clear();
    descriptionController.clear();
    dateController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "To-do list",
          style: TextStyle(
            fontSize: 30,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color.fromRGBO(2, 167, 177, 1),
      ),
      body: alldata.isEmpty
          ? const Center(
              child: Text(
                "No items found",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            )
          : ListView.builder(
              itemCount: alldata.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Expanded(
                        flex: 0,
                        child: Container(
                          decoration: BoxDecoration(
                            color: colorlist[index % colorlist.length],
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black
                                    .withOpacity(0.3), // Shadow color
                                blurRadius: 5, // Shadow blur
                                spreadRadius: 0, // Spread the shadow
                                offset: Offset(1,
                                    3), // Shadow position (horizontal, vertical)
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.all(10),
                                    height: 75,
                                    width: 75,
                                    decoration: const BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          height: 40,
                                          width: 40,
                                          child: SvgPicture.asset(
                                              "assets/svg/p1.svg"),
                                        )
                                      ],
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          "${alldata[index]["date"]}",
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.only(
                                            top: 10, left: 10),
                                        child: Text(
                                          "${alldata[index]["title"]}",
                                          style: const TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.all(10),
                                        width: 243,
                                        height: 44,
                                        child: Text(
                                          "${alldata[index]["description"]}",
                                          style: const TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                      Row(children: [
                                        const SizedBox(
                                          width: 230,
                                        ),
                                        GestureDetector(
                                          onTap: () => showbottomsheet(
                                              context, true, alldata[index]),
                                          child: SizedBox(
                                            height: 18,
                                            width: 18,
                                            child: SvgPicture.asset(
                                              "assets/svg/p2.svg",
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            deleteItem(alldata[index]['id']);
                                          },
                                          child: SizedBox(
                                              height: 18,
                                              width: 18,
                                              child: SvgPicture.asset(
                                                  "assets/svg/p3.svg")),
                                        ),
                                      ])
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showbottomsheet(context, false);
        },
        backgroundColor: const Color.fromRGBO(0, 139, 148, 1),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
