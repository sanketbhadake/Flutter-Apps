import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/cakelistModel.dart';
import 'package:project/cart.dart';
import 'package:project/categoryNav.dart';
import 'package:project/cookies.dart';

class BrowiniePage extends StatefulWidget {
  const BrowiniePage({super.key});

  @override
  State<BrowiniePage> createState() => _BrowiniePageState();
}

class _BrowiniePageState extends State<BrowiniePage> {
  List<browinieModel> browinielist = [
    browinieModel(
      image: 'assets/browinie/1.png',
      name: "Moist Chocolate Brownies",
      price: 120,
      count: 0,
      like: Icons.favorite_border_outlined,
      description: 'With Creamy peanut butter filling',
    ),
    browinieModel(
      image: 'assets/browinie/3.jpg',
      name: "Choco Chip Brownies",
      price: 90,
      count: 0,
      like: Icons.favorite_border_outlined,
      description: 'With Fudgy and dense chocolate',
    ),
    browinieModel(
      image: 'assets/browinie/4.jpg',
      name: "Brownie Bliss",
      price: 110,
      count: 0,
      like: Icons.favorite_border_outlined,
      description: 'With Golden brown tops',
    ),
    browinieModel(
      image: 'assets/browinie/5.png',
      name: "Reese's Cup Brownies",
      price: 130,
      count: 0,
      like: Icons.favorite_border_outlined,
      description: 'With Creamy Peanut Butter Layer',
    ),
    browinieModel(
      image: 'assets/browinie/6.png',
      name: "Choco Chip Blondies",
      price: 125,
      count: 0,
      like: Icons.favorite_border_outlined,
      description: 'With Buttery Delight',
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
          title: const Text("Browinie"),
          shape: const Border(
              bottom: BorderSide(
            color: Color.fromARGB(255, 230, 228, 228),
            width: 1,
          ))),
      // body:
      body: ListView.builder(
        itemCount: browinielist.length,
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
                      clipBehavior: Clip.antiAlias,
                      child: Image.asset(browinielist[index].image),
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
                                browinielist[index].name,
                                style: GoogleFonts.inter(fontSize: 18),
                              ),
                              Text(browinielist[index].description,
                                  style: GoogleFonts.inter(
                                      fontSize: 14,
                                      color:
                                          const Color.fromRGBO(80, 80, 80, 1))),
                              Text(
                                ' ₹${browinielist[index].price}',
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
                              'name': browinielist[index].name,
                              'description': browinielist[index].description,
                              'price': browinielist[index].price,
                              'imagePath': browinielist[index].image
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
                              : browinielist[index].like,
                          color: Colors.red,
                          size: 28,
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          final db = await initDatabase();

                          await addTocart(db, {
                            'name': browinielist[index].name,
                            'description': browinielist[index].description,
                            'price': browinielist[index].price,
                            'imagePath': browinielist[index].image,
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
