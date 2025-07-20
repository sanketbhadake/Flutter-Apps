import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/cakelistModel.dart';
import 'package:project/createCake6.dart';
//import 'package:project/createCake2.dart';

List<craeteCakeModel> cakelist5 = [
    craeteCakeModel(
      icons: Image.asset("assets/choocklet.png"),
      name: "Chocolate",
      price: 100,
    ),
    craeteCakeModel(
      icons: Image.asset("assets/Dryfruits.png"),
      name: "Dryfruits",
      price: 100,
    ),
    craeteCakeModel(
      icons: Image.asset("assets/vanila.png"),
      name: "Vannila",
      price: 100,
    ),
    craeteCakeModel(
      icons: Image.asset("assets/butterscoch.png"),
      name: "Butterscotch",
      price: 100,
    ),
    craeteCakeModel(
      icons: Image.asset("assets/blackcurrent.png"),
      name: "Black Currant",
      price: 100,
    ),
    craeteCakeModel(
      icons: Image.asset("assets/pineapple.png"),
      name: "Pineapple",
      price: 100,
    ),
  ];
class Createcake5 extends StatefulWidget {
  const Createcake5({super.key});

  @override
  State<Createcake5> createState() => _Createcake5State();
}

class _Createcake5State extends State<Createcake5> {
  

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
                  "Select Flavor",
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
              itemCount: cakelist5.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 15,
                childAspectRatio: 1.2,
              ),
              itemBuilder: (ctx, index) {
                //final cake = cakelist5[index];
                return GestureDetector(
                  onTap: () {
                    for (int i = 0; i < islike.length;i++) {
                      islike[i] = false;
                    }
                    islike[index] = true;
                     if (userChoices.length == 5) {
                      userChoices.removeLast();
                    }
                     userChoices.insert(4, index);
                    log("${userChoices[4]}-------------${cakelist5[userChoices[4]].name}");

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
                       
                          SizedBox(
                            height: 100,
                            width: 100,
                            child: cakelist5[index].icons,
                          ),
                          Text(
                            cakelist5[index].name,
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
                      MaterialPageRoute(builder: (context) => Createcake6()));
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
