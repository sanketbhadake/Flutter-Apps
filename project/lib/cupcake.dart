import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/cakelistModel.dart';
import 'package:project/cart.dart';
import 'package:project/categoryNav.dart';
import 'package:project/cookies.dart';
import 'package:sqflite/sqflite.dart';

List<bool> islike = List.filled(5, false);

class CupcakePage extends StatefulWidget {
  const CupcakePage({super.key});

  @override
  State<CupcakePage> createState() => _CupcakePageState();
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

class _CupcakePageState extends State<CupcakePage> {
  List<Cakelistmodel> cupcakelist = [
    Cakelistmodel(
      image: "assets/cupcake/1.png",
      name: "Moist Chocolate Cupcake",
      price: 150,
      count: 0,
      like: Icons.favorite_border_outlined,
      description: 'With whipped cream or frosting.',
    ),
    Cakelistmodel(
      image: "assets/cupcake/2.png",
      name: "Red Velvet Cupcakes",
      price: 150,
      count: 0,
      like: Icons.favorite_border_outlined,
      description: 'With small red heart-shaped sprinkle on top',
    ),
    Cakelistmodel(
      image: "assets/cupcake/3.png",
      name: "Carrot Cake Cupcakes",
      price: 150,
      count: 0,
      like: Icons.favorite_border_outlined,
      description: 'with Chocolate chips sprinkled on top',
    ),
    Cakelistmodel(
      image: "assets/cupcake/4.png",
      name: "Mint Chocolate Chip Cupcakes",
      price: 150,
      count: 0,
      like: Icons.favorite_border_outlined,
      description: 'With chocolate shavings on top of the frosting.',
    ),
    Cakelistmodel(
      image: "assets/cupcake/5.png",
      name: "Triple Chocolate Cupcakes",
      price: 150,
      count: 0,
      like: Icons.favorite_border_outlined,
      description: 'With swirl design on the frosting',
    ),
  ];

  int counter = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
            onPressed: () {
               Navigator.of(context).pushReplacement(
  MaterialPageRoute(builder: (context) => Category()),
);
            },
          ),
          title: const Text("Cup Cakes"),
          shape: const Border(
              bottom: BorderSide(
            color: Color.fromARGB(255, 230, 228, 228),
            width: 1,
          ))),
      // body: ListView.builder(
      //     itemCount: cupcakelist.length,
      //     shrinkWrap: true,
      //     itemBuilder: (Context, index) {
      //       return Padding(
      //         padding: const EdgeInsets.all(10.0),
      //         child: Container(
      //           height: 130,
      //           width: 380,
      //           decoration: BoxDecoration(
      //             boxShadow: const [
      //               BoxShadow(
      //                 color: Color.fromARGB(66, 0, 0, 0),
      //                 spreadRadius: 0,
      //                 blurRadius: 4,
      //                 offset: Offset(0, 2),
      //               ),
      //             ],
      //             color: Colors.white,
      //             borderRadius: BorderRadius.circular(20),
      //           ),
      //           child: Row(
      //             crossAxisAlignment: CrossAxisAlignment.center,
      //             mainAxisAlignment: MainAxisAlignment.center,
      //             children: [
      //               Container(
      //                 clipBehavior: Clip.antiAlias,
      //                 child: Image.asset(cupcakelist[index].image),
      //               ),
      //               Column(
      //                 mainAxisAlignment: MainAxisAlignment.center,
      //                 crossAxisAlignment: CrossAxisAlignment.start,
      //                 children: [
      //                   Expanded(
      //                     child: SizedBox(
      //                       width: 150,
      //                       child: Column(
      //                         mainAxisAlignment: MainAxisAlignment.center,
      //                         crossAxisAlignment: CrossAxisAlignment.start,
      //                         children: [
      //                           Text(
      //                             cupcakelist[index].name,
      //                             style: GoogleFonts.inter(fontSize: 18),
      //                           ),
      //                           Text("With Strawberry",
      //                               style: GoogleFonts.inter(
      //                                   fontSize: 14,
      //                                   color: const Color.fromRGBO(
      //                                       80, 80, 80, 1))),
      //                           Text(
      //                             ' ₹${cupcakelist[index].price}',
      //                             style: GoogleFonts.inter(
      //                               fontSize: 22,
      //                               color:
      //                                   const Color.fromRGBO(252, 120, 70, 1),
      //                             ),
      //                           ),
      //                         ],
      //                       ),
      //                     ),
      //                   ),
      //                 ],
      //               ),
      //               const Spacer(),
      //               Column(
      //                 crossAxisAlignment: CrossAxisAlignment.center,
      //                 mainAxisAlignment: MainAxisAlignment.center,
      //                 children: [
      //                   GestureDetector(
      //                     onTap: () {
      //                       islike[index] = !islike[index];
      //                       setState(() {});
      //                     },
      //                     child: Icon(
      //                       (islike[index])
      //                           ? Icons.favorite
      //                           : Icons.favorite_border,
      //                       color: Colors.red,
      //                     ),
      //                   ),
      //                   GestureDetector(
      //                     onTap: () async {
      //                       final db = await initDatabase();

      //                       await addTocart(db, {
      //                         'name': cupcakelist[index].name,
      //                         'description': 'With Strawberry',
      //                         'price': cupcakelist[index].price,
      //                         'imagePath': cupcakelist[index].image,
      //                         'message': "",
      //                         'weight': ""
      //                       });

      //                       Navigator.push(
      //                         context,
      //                         MaterialPageRoute(
      //                           builder: (context) => const Basket(),
      //                         ),
      //                       );

      //                       setState(() {});
      //                     },
      //                     child: Container(
      //                       margin: const EdgeInsets.all(16),
      //                       height: 35,
      //                       width: 60,
      //                       decoration: BoxDecoration(
      //                           color: const Color.fromRGBO(254, 114, 76, 1),
      //                           borderRadius: BorderRadius.circular(20)),
      //                       child: Center(
      //                           child: Text(
      //                         "ADD",
      //                         style: GoogleFonts.inter(
      //                             fontSize: 15, color: Colors.white),
      //                       )),
      //                     ),
      //                   ),
      //                 ],
      //               )
      //             ],
      //           ),
      //         ),
      //       );
      //     }),

      body: ListView.builder(
        itemCount: cupcakelist.length,
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
                      child: Image.asset(cupcakelist[index].image),
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
                                cupcakelist[index].name,
                                style: GoogleFonts.inter(fontSize: 18),
                              ),
                              Text(cupcakelist[index].description,
                                  style: GoogleFonts.inter(
                                      fontSize: 14,
                                      color:
                                          const Color.fromRGBO(80, 80, 80, 1))),
                              Text(
                                ' ₹${cupcakelist[index].price}',
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
                              'name': cupcakelist[index].name,
                              'description': cupcakelist[index].description,
                              'price': cupcakelist[index].price,
                              'imagePath': cupcakelist[index].image
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
                              : cupcakelist[index].like,
                          color: Colors.red,
                          size: 28,
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          final db = await initDatabase();

                          await addTocart(db, {
                            'name': cupcakelist[index].name,
                            'description': cupcakelist[index].description,
                            'price': cupcakelist[index].price,
                            'imagePath': cupcakelist[index].image,
                            'message': "",
                            'weight': ""
                          });

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Basket(),
                            ),
                          );

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
