import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/cakelistModel.dart';
import 'package:project/createCake2.dart';
import 'package:project/createCake6.dart';

List<craeteCakeModel> cakelist1 = [
  craeteCakeModel(
      icons: Image.asset("assets/regular.png"), name: "Regular", price: 50),
  craeteCakeModel(
      icons: Image.asset("assets/icon-gluttenfree-1.png"),
      name: "Gluten Free",
      price: 90),
  craeteCakeModel(
      icons: Image.asset("assets/icon-vegan.png"), name: "Vegan", price: 100),
  craeteCakeModel(
    icons: Image.asset("assets/icon-eggless.png"),
    name: "Eggless",
    price: 70,
  ),
  craeteCakeModel(
    icons: Image.asset("assets/sugar-free.png"),
    name: "Sugar Free",
    price: 100,
  ),
  craeteCakeModel(
    icons: Image.asset("assets/foundant.png"),
    name: "Fondant",
    price: 120,
  ),
];

class Createcake1 extends StatefulWidget {
  const Createcake1({super.key, required this.type});
  final String type;

  @override
  State<Createcake1> createState() => _Createcake1State();
}

class _Createcake1State extends State<Createcake1> {
  // List cakelist = [
  //   {
  //     "Cake1": [
  //       "Select Type",
  //       "Regular",
  //       "Gluten Free",
  //       "Vegan",
  //       "Eggless",
  //       "Sugar Free",
  //       "Fondant"
  //     ],
  //     "Icons": [
  //       Image.asset("assets/regular.png"),
  //       Image.asset("assets/icon-gluttenfree-1.png"),
  //       Image.asset("assets/icon-vegan.png"),
  //       Image.asset("assets/icon-eggless.png"),
  //       Image.asset("assets/sugar-free.png"),
  //       Image.asset("assets/foundant.png")
  //     ]
  //   },
  //   {
  //     "Cake1": [
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
  //   },
  //   {
  //     "Cake1": [
  //       "Select Size",
  //       "0.5 kg",
  //       "1.0 kg",
  //       "1.5 kg",
  //       "2.0 kg",
  //       "3.0 kg",
  //       "5.0 kg"
  //     ],
  //     "Icons": [
  //       Center(
  //         child: Text("Serves 5-7",
  //             style:
  //                 GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w500)),
  //       ),
  //       Center(
  //         child: Text("Serves 10-12",
  //             style:
  //                 GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w500)),
  //       ),
  //       Center(
  //         child: Text("Serves 15-20",
  //             style:
  //                 GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w500)),
  //       ),
  //       Center(
  //         child: Text("Serves 20-25",
  //             style:
  //                 GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w500)),
  //       ),
  //       Center(
  //         child: Text("Serves 35-40",
  //             style:
  //                 GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w500)),
  //       ),
  //       Center(
  //         child: Text("Serves 55-60",
  //             style:
  //                 GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w500)),
  //       ),
  //     ]
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
                  "Select Type",
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
              itemCount: cakelist1.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 15,
                childAspectRatio: 1.2,
              ),
              itemBuilder: (ctx, index) {
                //final cake = cakelist1[index];
                return GestureDetector(
                  onTap: () {
                    for (int i = 0; i < islike.length; i++) {
                      islike[i] = false;
                    }
                    islike[index] = true;
                    if (userChoices.length == 1) {
                      userChoices.removeLast();
                    }
                    userChoices.insert(0, index);

                    log("${userChoices[0]}-------------${cakelist1[userChoices[0]].name}");

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
                            child: cakelist1[index].icons,
                          ),
                          Text(
                            cakelist1[index].name,
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
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const Createcake2(
                        type: '', /*type: cakelist1[]*/
                      )));
              setState(() {});
            },
            child: Container(
              margin: const EdgeInsets.all(16),
              height: 45,
              width: 200,
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
    );
  }
}
