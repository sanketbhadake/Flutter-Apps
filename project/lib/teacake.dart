import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/cakelistModel.dart';
import 'package:project/cart.dart';
import 'package:project/categoryNav.dart';
import 'package:project/cookies.dart';

class TeacakePage extends StatefulWidget {
  const TeacakePage({super.key});

  @override
  State<TeacakePage> createState() => _TeacakePageState();
}

class _TeacakePageState extends State<TeacakePage> {
  List<teacakeModel> teacakelist = [
    teacakeModel(
        image: 'assets/tea cake/1.jpg',
        name: "Chocolate Biscuit Cake Perfection",
        price: 120,
        count: 0,
        like: Icons.favorite_border_outlined,
        description: 'with moist biscuits and creamy filling.'),
    teacakeModel(
      image: 'assets/tea cake/2.jpg',
      name: "Lavender Lemon Loaf Cake",
      price: 90,
      count: 0,
      like: Icons.favorite_border_outlined,
      description: 'With floral and citrus flavors.',
    ),
    teacakeModel(
      image: 'assets/tea cake/3.jpg',
      name: "Berry-licious Lemon Loaf Cake",
      price: 110,
      count: 0,
      like: Icons.favorite_border_outlined,
      description: 'With a sweet glaze.',
    ),
    teacakeModel(
      image: 'assets/tea cake/4.jpg',
      name: "Lemon Shortbread Perfection",
      price: 130,
      count: 0,
      like: Icons.favorite_border_outlined,
      description: 'With buttery texture and zesty lemon flavor.',
    ),
    teacakeModel(
      image: 'assets/tea cake/5.jpg',
      name: "Lemon Curd Delights",
      price: 125,
      count: 0,
      like: Icons.favorite_border_outlined,
      description: 'Tangy with lemon curd filling.',
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
          title: const Text("Tea Cake"),
          shape: const Border(
              bottom: BorderSide(
            color: Color.fromARGB(255, 230, 228, 228),
            width: 1,
          ))),
      // body: ListView.builder(
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
      //                   child: teacakelist[index].image,
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
      //                       child: Center(
      //                         child: Column(
      //                           mainAxisAlignment: MainAxisAlignment.center,
      //                           crossAxisAlignment: CrossAxisAlignment.start,
      //                           children: [
      //                             Text(
      //                               teacakelist[index].name,
      //                               style: GoogleFonts.inter(fontSize: 18),
      //                             ),
      //                             Text("With Strawberry",
      //                                 style: GoogleFonts.inter(
      //                                     fontSize: 14,
      //                                     color: const Color.fromRGBO(
      //                                         80, 80, 80, 1))),
      //                             Text(
      //                               teacakelist[index].price,
      //                               style: GoogleFonts.inter(
      //                                 fontSize: 22,
      //                                 color: const Color.fromRGBO(
      //                                     252, 120, 70, 1),
      //                               ),
      //                             ),
      //                           ],
      //                         ),
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
      //                           : teacakelist[index].like,
      //                       color: Colors.red,
      //                     ),
      //                   ),
      //                   const SizedBox(
      //                     height: 20,
      //                   ),
      //                   Row(
      //                     children: [
      //                       GestureDetector(
      //                         onTap: () {
      //                           if (teacakelist[index].count > 0) {
      //                             teacakelist[index].count--;
      //                           }
      //                           setState(() {});
      //                         },
      //                         child: const Icon(
      //                           Icons.remove_circle_outline,
      //                           size: 28,
      //                           color: Color.fromRGBO(252, 120, 70, 1),
      //                         ),
      //                       ),
      //                       const SizedBox(
      //                         width: 10,
      //                       ),
      //                       Text(
      //                         "${teacakelist[index].count}",
      //                         style: const TextStyle(fontSize: 25),
      //                       ),
      //                       const SizedBox(
      //                         width: 10,
      //                       ),
      //                       Padding(
      //                         padding: const EdgeInsets.only(right: 5.0),
      //                         child: GestureDetector(
      //                           onTap: () {
      //                             setState(() {
      //                               teacakelist[index].count++;
      //                             });
      //                           },
      //                           child: const Icon(
      //                             Icons.add_circle_outline,
      //                             size: 28,
      //                             color: Color.fromRGBO(252, 120, 70, 1),
      //                           ),
      //                         ),
      //                       ),
      //                     ],
      //                   ),
      //                 ],
      //               ),
      //             ],
      //           ),
      //         ),
      //       );
      //     }),

      body: ListView.builder(
        itemCount: teacakelist.length,
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
                      child: Image.asset(teacakelist[index].image),
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
                                teacakelist[index].name,
                                style: GoogleFonts.inter(fontSize: 18),
                              ),
                              Text(teacakelist[index].description,
                                  style: GoogleFonts.inter(
                                      fontSize: 14,
                                      color:
                                          const Color.fromRGBO(80, 80, 80, 1))),
                              Text(
                                ' ₹${teacakelist[index].price}',
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
                              'name': teacakelist[index].name,
                              'description': teacakelist[index].description,
                              'price': teacakelist[index].price,
                              'imagePath': teacakelist[index].image
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
                              : teacakelist[index].like,
                          color: Colors.red,
                          size: 28,
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          final db = await initDatabase();

                          await addTocart(db, {
                            'name': teacakelist[index].name,
                            'description': teacakelist[index].description,
                            'price': teacakelist[index].price,
                            'imagePath': teacakelist[index].image,
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
