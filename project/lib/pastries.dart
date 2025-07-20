import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/cakelistModel.dart';
import 'package:project/cart.dart';
import 'package:project/categoryNav.dart';
import 'package:project/cookies.dart';

class PastriesPage extends StatefulWidget {
  const PastriesPage({super.key});

  @override
  State<PastriesPage> createState() => _PastriesPageState();
}

class _PastriesPageState extends State<PastriesPage> {
  List<PastriesModel> pastrieslist = [
    PastriesModel(
      image: 'assets/pastries/1.png',
      name: "Chocolate Caramel Cake Perfection",
      price: 120,
      count: 0,
      like: Icons.favorite_border_outlined,
      description: 'With  creamy caramel filling.',
    ),
    PastriesModel(
      image: 'assets/pastries/2.jpg',
      name: "Blackberry Opera Cake Perfection",
      price: 120,
      count: 0,
      like: Icons.favorite_border_outlined,
      description: 'Gets a berry twist with the addition of fresh blackberries.',
    ),
    PastriesModel(
      image: 'assets/pastries/3.jpg',
      name: "Caramel Brownie Lasagna Perfection",
      price: 120,
      count: 0,
      like: Icons.favorite_border_outlined,
      description: 'Rich  with chocolate sauce',
    ),
    PastriesModel(
      image: 'assets/pastries/5.jpg',
      name: "Chocolate Raspberry Cake Perfection ",
      price: 120,
      count: 0,
      like: Icons.favorite_border_outlined,
      description: 'Rich with chocolate ganache',
    ),
    PastriesModel(
      image: 'assets/cookies/5.png',
      name: "Mocha Brownie Ice Cream Cake Perfection",
      price: 120,
      count: 0,
      like: Icons.favorite_border_outlined,
      description: 'With moist brownies, creamy ice cream.',
    ),
  ];
  List<bool> islike = List.filled(5, false);

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
          title: const Text("Pastries"),
          shape: const Border(
              bottom: BorderSide(
            color: Color.fromARGB(255, 230, 228, 228),
            width: 1,
          ))),
      body:
          //  ListView.builder(
          //     itemCount: 5,
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
          //               Center(
          //                 child: Container(
          //                   margin: const EdgeInsets.all(10),
          //                   height: 100,
          //                   width: 100,
          //                   decoration: const BoxDecoration(
          //                     shape: BoxShape.circle,
          //                     boxShadow: [
          //                       BoxShadow(
          //                         color: Color.fromARGB(66, 0, 0, 0),
          //                         spreadRadius: 0,
          //                         blurRadius: 4,
          //                         offset: Offset(0, 3),
          //                       ),
          //                     ],
          //                   ),
          //                   child: pastrieslist[index].image,
          //                   clipBehavior: Clip.antiAlias,
          //                 ),
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
          //                             pastrieslist[index].name,
          //                             style: GoogleFonts.inter(fontSize: 18),
          //                           ),
          //                           Text("With Strawberry",
          //                               style: GoogleFonts.inter(
          //                                   fontSize: 14,
          //                                   color: const Color.fromRGBO(
          //                                       80, 80, 80, 1))),
          //                           Text(
          //                             pastrieslist[index].price,
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
          //                   Container(
          //                     margin: const EdgeInsets.all(16),
          //                     height: 35,
          //                     width: 60,
          //                     decoration: BoxDecoration(
          //                         color: const Color.fromRGBO(254, 114, 76, 1),
          //                         borderRadius: BorderRadius.circular(20)),
          //                     child: Center(
          //                         child: Text(
          //                       "ADD",
          //                       style: GoogleFonts.inter(
          //                           fontSize: 15, color: Colors.white),
          //                     )),
          //                   ),
          //                 ],
          //               )
          //             ],
          //           ),
          //         ), ////
          //       );
          //     },
          //     ),
          ListView.builder(
        itemCount: pastrieslist.length,
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
                      child: Image.asset(pastrieslist[index].image),
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
                                pastrieslist[index].name,
                                style: GoogleFonts.inter(fontSize: 18),
                              ),
                              Text(pastrieslist[index].description,
                                  style: GoogleFonts.inter(
                                      fontSize: 14,
                                      color:
                                          const Color.fromRGBO(80, 80, 80, 1))),
                              Text(
                                ' ₹${pastrieslist[index].price}',
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
                              'name': pastrieslist[index].name,
                              'description': pastrieslist[index].description,
                              'price': pastrieslist[index].price,
                              'imagePath': pastrieslist[index].image
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
                              : pastrieslist[index].like,
                          color: Colors.red,
                          size: 28,
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          final db = await initDatabase();

                          await addTocart(db, {
                            'name': pastrieslist[index].name,
                            'description': pastrieslist[index].description,
                            'price': pastrieslist[index].price,
                            'imagePath': pastrieslist[index].image,
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
