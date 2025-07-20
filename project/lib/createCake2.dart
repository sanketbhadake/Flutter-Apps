import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/cakelistModel.dart';
import 'package:project/createCake6.dart';
import 'package:project/createcake3.dart';

List<craeteCakeModel> cakelist2 = [
  craeteCakeModel(
    icons: Image.asset("assets/hexza.png"),
    name: "Hexagon",
    price: 100,
  ),
  craeteCakeModel(
    icons: Image.asset("assets/heart.png"),
    name: "Heart",
    price: 100,
  ),
  craeteCakeModel(
    icons: Image.asset("assets/round.png"),
    name: "Round",
    price: 100,
  ),
  craeteCakeModel(
    icons: Image.asset("assets/Alpha.jpg"),
    name: "Alphabet",
    price: 100,
  ),
  craeteCakeModel(
    icons: Image.asset("assets/numeric.png"),
    name: "Numeric",
    price: 100,
  ),
  craeteCakeModel(
    icons: Image.asset("assets/fruit.png"),
    name: "Square",
    price: 100,
  ),
];

class Createcake2 extends StatefulWidget {
  const Createcake2({super.key, required String type});

  @override
  State<Createcake2> createState() => _Createcake2State();
}

class _Createcake2State extends State<Createcake2> {
//  "Cake1": [
  //       "Select Shape",
  //       "Hexagon",
  //       "Heart",
  //       "Round",
  //       "Alphabet",
  //       "Numeric",
  //       "Square"
  //     ],
  //     "Icons": [
  //       Image.asset("assets/hexza.png"),
  //       Image.asset("assets/heart.png"),
  //       Image.asset("assets/round.png"),
  //       Image.asset("assets/Alpha.jpg"),
  //       Image.asset("assets/numeric.png"),
  //       Image.asset("assets/fruit.png")
  //     ]
  //     "Cake1": [
  //       "Select Size",
  //       "0.5 kg",
  //       "1.0 kg",
  //       "1.5 kg",
  //       "2.0 kg",
  //       "3.0 kg",
  //       "5.0 kg"
  //     ],

  //   },
  //   {
  //     "Cake1": [
  //       "Select Tiers",
  //       "Single Tier",
  //       "Double Tier",
  //       "Triple Tier",
  //       "Four Tier",
  //       "Five Tier",
  //       "Six Tier"
  //     ],
  //     "Icons": [
  //       Image.asset("assets/redVevlet.png"),
  //       Image.asset("assets/doubletier.png"),
  //       Image.asset("assets/threetier.png"),
  //       Image.asset("assets/four tier.png"),
  //       Image.asset("assets/fivetier.png"),
  //       Image.asset("assets/sixtier.png")
  //     ]
  //   },
  //   {
  //     "Cake1": [
  //       "Select Flavor",
  //       "Chocolate",
  //       "Dryfruits",
  //       "Vannila",
  //       "Butterscotch",
  //       "Black Currant",
  //       "Pineapple"
  //     ],
  //     "Icons": [
  //       Image.asset("assets/choocklet.png"),
  //       Image.asset("assets/Dryfruits.png"),
  //       Image.asset("assets/vanila.png"),
  //       Image.asset("assets/butterscoch.png"),
  //       Image.asset("assets/blackcurrent.png"),
  //       Image.asset("assets/pineapple.png")
  //     ]
  //   },
  // ];
  List<bool> islike = List.filled(6, false);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.cake_outlined),
        title: Text(
          "Make your own cake",
          style: GoogleFonts.inter(fontSize: 25, fontWeight: FontWeight.w400),
        ),
        shape: const Border(
            bottom: BorderSide(
          color: Color.fromARGB(255, 230, 228, 228),
          width: 1,
        )),
      ),
      body: Column(
        children: [
          Container(
              margin: const EdgeInsets.only(left: 40, right: 40),
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: Text(
                  textAlign: TextAlign.center,
                  "Please select appropriate cake options from avalible choices.",
                  style: GoogleFonts.inter(
                      fontSize: 16,
                      color: const Color.fromARGB(255, 128, 125, 125)),
                ),
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  "Select Shape",
                  style: GoogleFonts.inter(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    // color: Colors.white
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: cakelist2.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 15,
                childAspectRatio: 1.2,
              ),
              itemBuilder: (ctx, index) {
                //final cake = cakelist2[index];
                return GestureDetector(
                  onTap: () {
                    for (int i = 0; i < islike.length; i++) {
                      islike[i] = false;
                    }
                    islike[index] = true;
                    if (userChoices.length == 2) {
                      userChoices.removeLast();
                    }
                    userChoices.insert(1, index);

                    log("${userChoices[1]}-------------${cakelist2[userChoices[1]].name}");

                    setState(() {});
                  },
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        color: islike[index]
                            ? const Color.fromARGB(255, 33, 208, 214)
                            : const Color.fromARGB(255, 232, 252, 255),
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // Image.asset("assets/foundant.png"),
                          // cakelist[createIndex]["Icons"][0],
                          SizedBox(
                            height: 100,
                            width: 100,
                            child: Center(
                              child: cakelist2[index].icons,
                            ),
                          ),
                          Text(
                            cakelist2[index].name,
                            style: GoogleFonts.inter(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                  setState(() {});
                },
                child: Container(
                  margin: const EdgeInsets.all(16),
                  height: 45,
                  width: 150,
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(254, 114, 76, 1),
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                      child: Text(
                    "Previous",
                    style: GoogleFonts.inter(fontSize: 20, color: Colors.white),
                  )),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const Createcake3()));
                  setState(() {});
                },
                child: Container(
                  margin: const EdgeInsets.all(16),
                  height: 45,
                  width: 150,
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(254, 114, 76, 1),
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                      child: Text(
                    "Continue",
                    style: GoogleFonts.inter(fontSize: 20, color: Colors.white),
                  )),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
