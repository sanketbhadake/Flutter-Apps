import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:project/FirebaseHelper.dart';
import 'package:project/favourite_model.dart';
import 'package:project/profile.dart';
import 'package:sqflite/sqflite.dart';
import 'cookies.dart';
// import 'cookies.dart';

// List<bool> islike = List.filled(5, false);

class FavouritePage extends StatefulWidget {
  const FavouritePage({super.key});

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

Future<List<Map<String, dynamic>>> getFavorites(Database db) async {
  return await db.query('items');
}

class _FavouritePageState extends State<FavouritePage> {
  late Future<List<FavoriteCookie>> favorites;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
            onPressed: () {
        Navigator.of(context).pop();
            },
          ),
          title: const Text("Favourite"),
          shape: const Border(
              bottom: BorderSide(
            color: Color.fromARGB(255, 230, 228, 228),
            width: 1,
          ))),
      body: FutureBuilder(
        future: initDatabase().then((db) => getFavorites(db)),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            final favorites = snapshot.data as List<Map<String, dynamic>>;
            return ListView.builder(
              itemCount: favorites.length,
              itemBuilder: (context, index) {
                final item = favorites[index];
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: 130,
                    width: MediaQuery.of(context).size.width,
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
                      mainAxisAlignment: MainAxisAlignment.center,
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
                            clipBehavior: Clip.antiAlias,
                            child: Image.asset(item['imagePath'],
                                fit: BoxFit.cover),
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
                                      (item['name']),
                                      style: GoogleFonts.inter(fontSize: 18),
                                    ),
                                    Text('With Strawberry',
                                        style: GoogleFonts.inter(
                                            fontSize: 14,
                                            color: const Color.fromRGBO(
                                                80, 80, 80, 1))),
                                    Text(
                                      '₹${item['price']}',
                                      style: GoogleFonts.inter(
                                        fontSize: 22,
                                        color: const Color.fromRGBO(
                                            252, 120, 70, 1),
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
                                islike[index] = !islike[index];
                                final db = await initDatabase();

                                await db.delete('items',
                                    where: 'name = ?',
                                    whereArgs: [item['name']]);
                                setState(() {});
                              },
                              child: Icon(
                                Icons.favorite,
                                color: Colors.red,
                                size: 28,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                margin: const EdgeInsets.all(16),
                                height: 35,
                                width: 60,
                                decoration: BoxDecoration(
                                    color:
                                        const Color.fromRGBO(254, 114, 76, 1),
                                    borderRadius: BorderRadius.circular(20)),
                                child: Center(
                                    child: Text(
                                  "ADD",
                                  style: GoogleFonts.inter(
                                      fontSize: 15, color: Colors.white),
                                )),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          }
          return Center(child: Text('No favorites yet!'));
        },
      ),
    );
  }
}
