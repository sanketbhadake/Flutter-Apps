import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sqflite/sqflite.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart';

class AdvanceTodo extends StatefulWidget {
  const AdvanceTodo({super.key});

  @override
  State<AdvanceTodo> createState() => _AdvanceTodoState();
}

class _AdvanceTodoState extends State<AdvanceTodo> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    initializeDatabase();
  }

  late Database database;
  Future<void> initializeDatabase() async {
    final dbpath = await getDatabasesPath();
    final path = join(dbpath, 'advance.db');
    database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
        CREATE TABLE Advancetodo (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT NOT NULL,
            description TEXT NOT NULL,
            date TEXT NOT NULL
          )
       ''');
        log("TABLE CREATE SUCCESSFULLY");
      },
    );
    fetchdata();
  }

  Future<void> fetchdata() async {
    cards = await database.query("Advancetodo");
    log('Fetched Data: $cards');
    setState(() {});
  }

  Future<void> addTodata(Map<String, dynamic> item) async {
    await database.insert(
      "Advancetodo",
      item,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    fetchdata();
  }

  Future<void> deleteItem(int id) async {
    await database.delete(
      'Advancetodo',
      where: 'id = ?',
      whereArgs: [id],
    );
    fetchdata();
  }

  Future<void> updateItem(
      int id, String title, String description, String date) async {
    await database.update(
      'Advancetodo', // Table name
      {
        'title': title, // Updated title value
        'description': description, // Updated description value
        'date': date, // Updated date value
      },
      where: 'id = ?', // Where clause to identify the record
      whereArgs: [id], // Arguments for the where clause
    );
    fetchdata();
  }

  void onUpdateButtonPressed(Map<String, dynamic> todoItem) {
    updateItem(
      todoItem['id'], // Pass the id of the task to be updated
      titleController.text, // New title value from controller
      descriptionController.text, // New description value from controller
      dateController.text, // New date value from controller
    ).then((_) {});
  }

  void clearController() {
    titleController.clear();
    descriptionController.clear();
    dateController.clear();
  }

  List cards = [];
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
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Center(
                    child: Text(
                      "Create To-Do",
                      style: GoogleFonts.quicksand(
                          fontSize: 22, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Text("Title",
                      style: TextStyle(color: Color.fromRGBO(111, 81, 255, 1))),
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
                        fillColor: Color.fromRGBO(111, 81, 255, 1)),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Text("Discription",
                      style: TextStyle(color: Color.fromRGBO(111, 81, 255, 1))),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 15, right: 15, bottom: 15),
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
                    style: TextStyle(color: Color.fromRGBO(111, 81, 255, 1)),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 15, right: 15, bottom: 15),
                  child: TextField(
                    controller: dateController,
                    decoration: InputDecoration(
                      suffixIcon: GestureDetector(
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                              context: context,
                              firstDate: DateTime(2024),
                              lastDate: DateTime(2026));
                          String formattedDate =
                              DateFormat.yMMMd().format(pickedDate!);
                          setState(() {
                            dateController.text = formattedDate;
                          });
                        },
                        child: const Icon(
                          Icons.calendar_month_outlined,
                          color: Color.fromRGBO(111, 81, 255, 1),
                        ),
                      ),
                      border: const OutlineInputBorder(),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if (titleController.text.trim().isNotEmpty &&
                        descriptionController.text.trim().isNotEmpty &&
                        dateController.text.trim().isNotEmpty) {
                      if (doedit && todoItem != null) {
                        onUpdateButtonPressed(todoItem);
                        Navigator.of(context).pop();
                        clearController();
                      } else {
                        addTodata({
                          'title': titleController.text,
                          'description': descriptionController.text,
                          'date': dateController.text,
                        });
                        log("data inserted");
                        Navigator.of(context).pop();
                        clearController();
                      }
                    }
                  },
                  child: Container(
                    margin: const EdgeInsets.all(15),
                    height: 60,
                    width: 400,
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(111, 81, 255, 1),
                        borderRadius: BorderRadius.circular(15)),
                    child: const Center(
                      child: Padding(
                        padding: EdgeInsets.only(left: 15, right: 15),
                        child: Text("Submit",
                            style:
                                TextStyle(fontSize: 20, color: Colors.white)),
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(111, 81, 255, 1),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 70, left: 30),
            child: Text(
              "Good morning",
              style: GoogleFonts.quicksand(
                  fontSize: 26,
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 30, bottom: 50),
            child: Text(
              "Sanket",
              style: GoogleFonts.quicksand(
                  fontSize: 35,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ),
          ),
          Expanded(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(217, 217, 217, 1),
                  borderRadius: BorderRadius.circular(
                    40,
                  )),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(15),
                    child: Text(
                      textAlign: TextAlign.center,
                      "CREATE TO DO LIST",
                      style: GoogleFonts.quicksand(
                          fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                          color: Color.fromRGBO(255, 255, 255, 1),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(40),
                              topRight: Radius.circular(40))),
                      child: cards.isEmpty
                          ? const Center(
                              child: Text(
                                "No items found",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            )
                          : ListView.builder(
                              itemCount: cards.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return Slidable(
                                  endActionPane: ActionPane(
                                      motion: const ScrollMotion(),
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Container(
                                                margin: const EdgeInsets.only(
                                                    left: 20),
                                                height: 34,
                                                width: 34,
                                                decoration: const BoxDecoration(
                                                    color: Color.fromRGBO(
                                                        89, 57, 241, 1),
                                                    shape: BoxShape.circle),
                                                child: GestureDetector(
                                                  onTap: () {
                                                    showbottomsheet(context,
                                                        true, cards[index]);
                                                  },
                                                  child: const Icon(
                                                    Icons.edit,
                                                    color: Colors.white,
                                                  ),
                                                )),
                                            Container(
                                              margin: const EdgeInsets.only(
                                                  left: 20),
                                              height: 34,
                                              width: 34,
                                              decoration: const BoxDecoration(
                                                  color: Color.fromRGBO(
                                                      89, 57, 241, 1),
                                                  shape: BoxShape.circle),
                                              child: GestureDetector(
                                                onTap: () {
                                                  deleteItem(
                                                      cards[index]['id']);
                                                  setState(() {});
                                                },
                                                child: const Icon(
                                                  Icons.delete,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ]),
                                  child: Container(
                                    margin: const EdgeInsets.only(bottom: 15),
                                    height: 100,
                                    width: MediaQuery.of(context).size.width,
                                    decoration: const BoxDecoration(
                                      color: Color.fromRGBO(255, 255, 255, 1),
                                      boxShadow: [
                                        BoxShadow(
                                          color:
                                              Color.fromRGBO(189, 189, 189, 1),
                                          spreadRadius: 0,
                                          blurRadius: 14,
                                          offset: Offset(0, 5),
                                        ),
                                      ],
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.all(15),
                                          height: 60,
                                          width: 60,
                                          decoration: const BoxDecoration(
                                            color: Color.fromRGBO(
                                                217, 217, 217, 1),
                                            shape: BoxShape.circle,
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(14.0),
                                            child: SvgPicture.asset(
                                              "assets/svg/G1.svg",
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                cards[index]["title"],
                                                style: GoogleFonts.inter(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                cards[index]['description'],
                                                style: GoogleFonts.inter(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w400,
                                                    color: const Color.fromRGBO(
                                                        0, 0, 0, 0.7)),
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                cards[index]['date'],
                                                style: GoogleFonts.inter(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w400,
                                                    color: const Color.fromRGBO(
                                                        0, 0, 0, 0.7)),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              }),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showbottomsheet(context, false);
        },
        backgroundColor: const Color.fromRGBO(89, 57, 241, 1),
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 50,
        ),
      ),
    );
  }
}
