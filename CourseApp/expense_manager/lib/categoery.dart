import 'dart:ui';

import 'package:expense_manager/modelclass.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Categoery extends StatefulWidget {
  const Categoery({super.key});

  @override
  State<Categoery> createState() => _CategoeryState();
}

class _CategoeryState extends State<Categoery> {
  void showdialogbox(BuildContext context, categori) {
    showDialog(
        context: context,
        builder: (BuildContext) => AlertDialog(
              title: const Text("Delete Category"),
              content: const Text(
                  "Are you sure you want to delete the selected category?"),
              actions: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                      onPressed: () {},
                      style: const ButtonStyle(
                          maximumSize: WidgetStatePropertyAll(Size(300, 165)),
                          
                          backgroundColor: WidgetStatePropertyAll(
                            Color.fromRGBO(14, 161, 125, 1),
                          )),
                      child: Text(
                        "Delete",
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                        selectionColor: const Color.fromRGBO(14, 161, 125, 1),
                      ),
                    ),
                    TextButton(
                        onPressed: () {},
                        style: const ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll(
                          Color.fromRGBO(140, 128, 128, 0.2),
                        )),
                        child: Text(
                          "Cancel",
                          style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.black),
                        )),
                  ],
                ),
              ],
            ));
  }

  void showbottomsheet() {
    showModalBottomSheet(
        context: context,
        builder: (context) => Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      height: 90,
                      width: 90,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromRGBO(140, 128, 128, 0.2)),
                      child: Image.asset("assets/gallary.png"),
                    ),
                  ),
                  Center(
                      child: Text(
                    "Add",
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  )),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Image URL",
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Enter URL",
                      hintStyle: const TextStyle(
                          color: Color.fromRGBO(33, 33, 33, 0.429)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Category",
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Enter Category Name",
                      hintStyle: const TextStyle(
                          color: Color.fromRGBO(33, 33, 33, 0.429)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: Container(
                      height: 40,
                      width: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(70),
                        color: const Color.fromRGBO(14, 161, 125, 1),
                      ),
                      child: Center(
                          child: Text(
                        "Add",
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      )),
                    ),
                  )
                ],
              ),
            ));
  }

  List<Map<dynamic, String>> categories = [
    {"image": "assets/food.png", "name": "Food"},
    {"image": "assets/fuel.png", "name": "Fuel"},
    {"image": "assets/medicine.png", "name": "Medicine"},
    {"image": "assets/shopping.png", "name": "Shopping"}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Categories"),
      ),
      body: GestureDetector(
        onTap: () {
          showdialogbox(context, categories);
        },
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Number of columns
              crossAxisSpacing: 20.0, // Horizontal spacing between items
              mainAxisSpacing: 20.0,
              childAspectRatio: 0.9,
            ),
            itemCount: 4,
            itemBuilder: (BuildContext context, int index) => GestureDetector(
              onLongPress: () => showdialogbox(context, categories[index]),
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: const [
                      BoxShadow(
                          color: Color.fromARGB(94, 0, 0, 0),
                          offset: Offset(
                            1.0,
                            2.0,
                          ),
                          blurRadius: 6.0,
                          spreadRadius: 0),
                    ]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(child: Image.asset(categories[index]['image']!)),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                          child: Text(
                        categories[index]['name']!,
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      )),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: showbottomsheet,
        label: Text(
          'Add Category',
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
        ),
        icon: const Icon(
          Icons.add,
          color: Color.fromRGBO(14, 161, 125, 1),
          size: 35,
          weight: 900,
          shadows: [
            Shadow(
              color: Colors.black,
              offset: Offset(0, 2),
              blurRadius: 5,
            )
          ],
        ),
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
