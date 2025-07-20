import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/cakelistModel.dart';
//import 'package:project/Createcake4.dart';
import 'package:project/createCake5.dart';
import 'package:project/createCake6.dart';

List<craeteCakeModel> cakelist4 = [
    craeteCakeModel(
      icons: Image.asset("assets/redVevlet.png"),
      name: "Single Tier",
      price: 100,
    ),
    craeteCakeModel(
      icons: Image.asset("assets/doubletier.png"),
      name: "Double Tier",
      price: 150,
    ),
    craeteCakeModel(
      icons: Image.asset("assets/threetier.png"),
      name: "Triple Tier",
      price: 300,
    ),
    craeteCakeModel(
      icons: Image.asset("assets/four tier.png"),
      name: "Four Tier",
      price: 450,
    ),
    craeteCakeModel(
      icons: Image.asset("assets/fivetier.png"),
      name: "Five Tier",
      price: 600,
    ),
    craeteCakeModel(
      icons: Image.asset("assets/sixtier.png"),
      name: "Six Tier",
      price: 700,
    )
  ];
class Createcake4 extends StatefulWidget {
  const Createcake4({super.key});

  @override
  State<Createcake4> createState() => _Createcake4State();
}

class _Createcake4State extends State<Createcake4> {
  

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
                  "Select Tier",
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
              itemCount: cakelist4.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 15,
                childAspectRatio: 1.2,
              ),
              itemBuilder: (ctx, index) {
                //final cake = cakelist4[index];
                return GestureDetector(
                  onTap: () {
                    for (int i = 0; i < islike.length;i++) {
                      islike[i] = false;
                    }
                    islike[index] = true;
                     if (userChoices.length == 4) {
                      userChoices.removeLast();
                       
                    }
                    userChoices.insert(3, index);

                    log("${userChoices[3]}-------------${cakelist4[userChoices[3]].name}");


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
                              child: cakelist4[index].icons,
                            ),
                          ),
                          Text(
                            cakelist4[index].name,
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
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Createcake5()));
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
