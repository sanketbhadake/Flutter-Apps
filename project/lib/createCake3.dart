import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/cakelistModel.dart';
import 'package:project/createCake6.dart';

import 'package:project/createcake4.dart';

List<craeteCakeModel> cakelist3 = [
  craeteCakeModel(
    icons: "Serves 5-7",
    name: "0.5 kg",
    price: 150,
  ),
  craeteCakeModel(
    icons: "Serves 10-12",
    name: "1.0 kg",
    price: 300,
  ),
  craeteCakeModel(
    icons: "Serves 15-20",
    name: "1.5 kg",
    price: 450,
  ),
  craeteCakeModel(
    icons: "Serves 20-25",
    name: "2.0 kg",
    price: 600,
  ),
  craeteCakeModel(
    icons: "Serves 35-40",
    name: "3.0 kg",
    price: 900,
  ),
  craeteCakeModel(
    icons: "Serves 55-60",
    name: "5.0 kg",
    price: 1500,
  ),
];

class Createcake3 extends StatefulWidget {
  const Createcake3({super.key});

  @override
  State<Createcake3> createState() => _Createcake3State();
}

class _Createcake3State extends State<Createcake3> {
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
                  "Select Size",
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
              itemCount: cakelist3.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 15,
                childAspectRatio: 1.2,
              ),
              itemBuilder: (ctx, index) {
                return GestureDetector(
                  onTap: () {
                    for (int i = 0; i < islike.length; i++) {
                      islike[i] = false;
                    }
                    islike[index] = true;
                    if (userChoices.length == 3) {
                      userChoices.removeLast();
                    }
                    userChoices.insert(2, index);

                    log("${userChoices[2]}-------------${cakelist3[userChoices[2]].name}");

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
                              child: Text(cakelist3[index].icons,
                                  style: GoogleFonts.inter(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600)),
                            ),
                          ),
                          Text(
                            cakelist3[index].name,
                            style: GoogleFonts.inter(
                                fontSize: 22, fontWeight: FontWeight.w700),
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
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Createcake4()));
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
