import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/DBHelper.dart';
//import 'package:project/FirebaseHelper.dart';
import 'package:project/cakelistModel.dart';
import 'package:project/cart.dart';
import 'package:project/categoryNav.dart';
import 'package:project/favourite.dart';
import 'package:project/favourite_model.dart';
import 'package:sqflite/sqflite.dart';

import 'package:path/path.dart';

List<bool> islike = List.filled(5, false);

Future<Database> initDatabase() async {
  // Get the default database location
  final dbPath = await getDatabasesPath();
  final path = join(dbPath, 'app_database.db');

  // Open or create the database
  return openDatabase(
    path,
    onCreate: (db, version) {
      return db.execute('''
        CREATE TABLE IF NOT EXISTS items(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          name TEXT,
          description TEXT,
          price INTEGER,
          imagePath TEXT,
          message TEXT,
          weight TEXT
        );
        ''');
    },
    version: 1,
  );
}

Future<void> addToFavorites(Database db, Map<String, dynamic> product) async {
  await db.insert(
    'items',
    product,
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}

Future<void> addTocart(Database db, Map<String, dynamic> product) async {
  await db.insert(
    'items',
    product,
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}
// Future<void> order(Database db, Map<String, dynamic> product) async {
//   await db.insert(
//     'orders',
//     product,
//     conflictAlgorithm: ConflictAlgorithm.replace,
//   );
// }

// Future<void> insertItem(Database db, String name, String description, int price) async {
//   await db.insert(
//     'items',
//     {'name': name, 'description': description, 'price': price},
//     conflictAlgorithm: ConflictAlgorithm.replace,
//   );
// }
Future<List<Map<String, dynamic>>> fetchItems(Database db) async {
  return await db.query('items');
}

class CookiesPage extends StatefulWidget {
  const CookiesPage({super.key});

  @override
  State<CookiesPage> createState() => _CookiesPageState();
}

class _CookiesPageState extends State<CookiesPage> {
  List<CookiesModel> cookieslist = [
    CookiesModel(
      image: 'assets/cookies/1.png',
      name: "Pepperoni Brownie Cookies",
      price: 120,
      count: 0,
      like: Icons.favorite_border_outlined,
      description: "topped with mini pepperoni slices",
    ),
    CookiesModel(
      image: 'assets/cookies/2.jpeg',
      name: "Crinkle Cookies",
      price: 90,
      count: 0,
      like: Icons.favorite_border_outlined,
      description: "with rich chocolate flavor",
    ),
    CookiesModel(
      image: 'assets/cookies/3.jpg',
      name: "Chocolate chip Cookies,",
      price: 130,
      count: 0,
      like: Icons.favorite_border_outlined,
      description: "loaded with chocolate chips",
    ),
    CookiesModel(
      image: 'assets/cookies/4.png',
      name: "Peanut Butter Cookies",
      price: 130,
      count: 0,
      like: Icons.favorite_border_outlined,
      description: "with a chocolate swirl on top",
    ),
    CookiesModel(
      image: 'assets/cookies/5.png',
      name: "Pistachio Cookies",
      price: 130,
      count: 0,
      like: Icons.favorite_border_outlined,
      description: "studded with chopped pistachios",
    ),
  ];

  final dbHelper = DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => Category(),
              ),
            );
          },
        ),
        title: const Text("Cookies"),
        shape: const Border(
          bottom: BorderSide(
            color: Color.fromARGB(255, 230, 228, 228),
            width: 1,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: cookieslist.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: 130,
              width: 380,
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromARGB(66, 0, 0, 0),
                    spreadRadius: 0,
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      height: 100,
                      width: 100,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(66, 0, 0, 0),
                            spreadRadius: 0,
                            blurRadius: 4,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Image.asset(cookieslist[index].image),
                      clipBehavior: Clip.antiAlias,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: SizedBox(
                          width: 150,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                cookieslist[index].name,
                                style: GoogleFonts.inter(fontSize: 18),
                              ),
                              Text(cookieslist[index].description,
                                  style: GoogleFonts.inter(
                                      fontSize: 14,
                                      color:
                                          const Color.fromRGBO(80, 80, 80, 1))),
                              Text(
                                ' ₹${cookieslist[index].price}',
                                style: GoogleFonts.inter(
                                  fontSize: 22,
                                  color: const Color.fromRGBO(252, 120, 70, 1),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () async {
                          final db = await initDatabase();
                          if (!islike[index]) {
                            await addToFavorites(db, {
                              'name': cookieslist[index].name,
                              'description': cookieslist[index].description,
                              'price': cookieslist[index].price,
                              'imagePath': cookieslist[index].image,
                              'like': false
                            });
                          } else {
                            await db.delete('items',
                                where: 'name = ?', whereArgs: ['no']);
                          }

                          setState(() {
                            islike[index] = !islike[index];
                          });
                        },
                        child: Icon(
                          islike[index]
                              ? Icons.favorite
                              : cookieslist[index].like,
                          color: Colors.red,
                          size: 28,
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          final db = await initDatabase();

                          await addTocart(db, {
                            'name': cookieslist[index].name,
                            'description': cookieslist[index].description,
                            'price': cookieslist[index].price,
                            'imagePath': cookieslist[index].image,
                            'message': "",
                            'weight': ""
                          });

                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => const Basket(),
                          //   ),
                          // );

                          setState(() {});
                        },
                        child: Container(
                          margin: const EdgeInsets.all(16),
                          height: 35,
                          width: 42,
                          decoration: BoxDecoration(
                              color: const Color.fromRGBO(254, 114, 76, 1),
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                              child: Text(
                            "ADD",
                            style: GoogleFonts.inter(
                                fontSize: 15, color: Colors.white),
                          )),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
