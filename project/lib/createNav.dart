//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:project/cakelistModel.dart';

class Createnav extends StatefulWidget {
  const Createnav({super.key});

  @override
  State<Createnav> createState() => _CreatenavState();
}

class _CreatenavState extends State<Createnav> {
  List<bool> islike = List.filled(6, false);

  // List cakelists = [
  //   {
  //     "select": [
  //       "Select Type",
  //     ],
  //     "icons": [
  //       Image.asset("assets/regular.png"),
  //     ],
  //     "name": [
  //       "Regular",
  //       "Hexagon",
  //     ],
  //   }
  // ];
  // craeteCakeModel(
  //     select: "Select Type",
  //     icons: Image.asset("assets/icon-gluttenfree-1.png"),
  //     name: "Gluten Free"),
  // craeteCakeModel(
  //   select: "Select Type",
  //   icons: Image.asset("assets/icon-vegan.png"),
  //   name: "Vegan",
  // ),
  // craeteCakeModel(
  //   select: "Select Type",
  //   icons: Image.asset("assets/icon-eggless.png"),
  //   name: "Eggless",
  // ),
  // craeteCakeModel(
  //   select: "Select Type",
  //   icons: Image.asset("assets/sugar-free.png"),
  //   name: "Sugar Free",
  // ),
  // craeteCakeModel(
  //     select: "Select Type",
  //     icons: Image.asset("assets/foundant.png"),
  //     name: "Fondant"),
  List cakelist = [
    {
      "Cake1": [
        "Select Type",
        "Regular",
        "Gluten Free",
        "Vegan",
        "Eggless",
        "Sugar Free",
        "Fondant"
      ],
      "Icons": [
        Image.asset("assets/regular.png"),
        Image.asset("assets/icon-gluttenfree-1.png"),
        Image.asset("assets/icon-vegan.png"),
        Image.asset("assets/icon-eggless.png"),
        Image.asset("assets/sugar-free.png"),
        Image.asset("assets/foundant.png")
      ]
    },
    {
      "Cake1": [
        "Select Shape",
        "Hexagon",
        "Heart",
        "Round",
        "Alphabet",
        "Numeric",
        "Square"
      ],
      "Icons": [
        Image.asset("assets/hexza.png"),
        Image.asset("assets/heart.png"),
        Image.asset("assets/round.png"),
        Image.asset("assets/Alpha.jpg"),
        Image.asset("assets/numeric.png"),
        Image.asset("assets/fruit.png")
      ]
    },
    {
      "Cake1": [
        "Select Size",
        "0.5 kg",
        "1.0 kg",
        "1.5 kg",
        "2.0 kg",
        "3.0 kg",
        "5.0 kg"
      ],
      "Icons": [
        Center(
          child: Text("Serves 5-7",
              style:
                  GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w500)),
        ),
        Center(
          child: Text("Serves 10-12",
              style:
                  GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w500)),
        ),
        Center(
          child: Text("Serves 15-20",
              style:
                  GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w500)),
        ),
        Center(
          child: Text("Serves 20-25",
              style:
                  GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w500)),
        ),
        Center(
          child: Text("Serves 35-40",
              style:
                  GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w500)),
        ),
        Center(
          child: Text("Serves 55-60",
              style:
                  GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w500)),
        ),
      ]
    },
    {
      "Cake1": [
        "Select Tiers",
        "Single Tier",
        "Double Tier",
        "Triple Tier",
        "Four Tier",
        "Five Tier",
        "Six Tier"
      ],
      "Icons": [
        Image.asset("assets/redVevlet.png"),
        Image.asset("assets/doubletier.png"),
        Image.asset("assets/threetier.png"),
        Image.asset("assets/four tier.png"),
        Image.asset("assets/fivetier.png"),
        Image.asset("assets/sixtier.png")
      ]
    },
    {
      "Cake1": [
        "Select Flavor",
        "Chocolate",
        "Dryfruits",
        "Vannila",
        "Butterscotch",
        "Black Currant",
        "Pineapple"
      ],
      "Icons": [
        Image.asset("assets/choocklet.png"),
        Image.asset("assets/Dryfruits.png"),
        Image.asset("assets/vanila.png"),
        Image.asset("assets/butterscoch.png"),
        Image.asset("assets/blackcurrent.png"),
        Image.asset("assets/pineapple.png")
      ]
    },
  ];
  // WidgetStateProperty<Color?>choicecake(){
  //   if(createIndex!=0){

  //   }
  // }

  
  int createIndex = 0;
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
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
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
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // SizedBox(
              //   width: 20,
              // ),
              Container(
                // decoration: BoxDecoration(
                //     color: const Color.fromARGB(255, 232, 252, 255),
                //     borderRadius: BorderRadius.only(
                //         bottomRight: Radius.circular(10),
                //         topRight: Radius.circular(10))),
                child: Center(
                  child: Text(
                    cakelist[createIndex]["Cake1"][0],
                    style: GoogleFonts.inter(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                      // color: Colors.white
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  islike[0] = !islike[0];
                  setState(() {});
                },
                child: Container(
                  height: 150,
                  width: 180,
                  decoration: BoxDecoration(
                      // boxShadow: const [
                      //   BoxShadow(
                      //     color: Color.fromARGB(66, 0, 0, 0),
                      //     spreadRadius: 0,
                      //     blurRadius: 4,
                      //     offset: Offset(0, 2),
                      //   ),
                      // ],
                      color: islike[0]
                          ? const Color.fromARGB(255, 232, 252, 255)
                          : const Color.fromARGB(255, 33, 208, 214),
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
                          child: cakelist[createIndex]["Icons"][0],
                        ),
                        Text(cakelist[createIndex]["Cake1"][1],
                            style: GoogleFonts.inter(
                              fontSize: 16,
                            )),
                      ],
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  islike[1] = !islike[1];
                  setState(() {});
                },
                child: Container(
                  height: 150,
                  width: 180,
                  decoration: BoxDecoration(
                      color: islike[1]
                          ? const Color.fromARGB(255, 232, 252, 255)
                          : const Color.fromARGB(255, 33, 208, 214),
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 100,
                          width: 100,
                          child: cakelist[createIndex]["Icons"][1],
                        ),
                        Text(cakelist[createIndex]["Cake1"][2],
                            style: GoogleFonts.inter(
                              fontSize: 16,
                            )),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  islike[2] = !islike[2];
                  setState(() {});
                },
                child: Container(
                  height: 150,
                  width: 180,
                  decoration: BoxDecoration(
                      color: islike[2]
                          ? const Color.fromARGB(255, 232, 252, 255)
                          : const Color.fromARGB(255, 33, 208, 214),
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 100,
                          width: 100,
                          child: cakelist[createIndex]["Icons"][2],
                        ),
                        Text(cakelist[createIndex]["Cake1"][3],
                            style: GoogleFonts.inter(
                              fontSize: 16,
                            )),
                      ],
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  islike[3] = !islike[3];
                  setState(() {});
                },
                child: Container(
                  height: 150,
                  width: 180,
                  decoration: BoxDecoration(
                      color: islike[3]
                          ? const Color.fromARGB(255, 232, 252, 255)
                          : const Color.fromARGB(255, 33, 208, 214),
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 100,
                          width: 100,
                          child: cakelist[createIndex]["Icons"][3],
                        ),
                        Text(cakelist[createIndex]["Cake1"][4],
                            style: GoogleFonts.inter(
                              fontSize: 16,
                            )),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  islike[4] = !islike[4];
                  setState(() {});
                },
                child: Container(
                  height: 150,
                  width: 180,
                  decoration: BoxDecoration(
                      color: islike[4]
                          ? const Color.fromARGB(255, 232, 252, 255)
                          : const Color.fromARGB(255, 33, 208, 214),
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 100,
                          width: 100,
                          child: cakelist[createIndex]["Icons"][4],
                        ),
                        Text(cakelist[createIndex]["Cake1"][5],
                            style: GoogleFonts.inter(
                              fontSize: 16,
                            )),
                      ],
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  islike[5] = !islike[5];
                  setState(() {});
                },
                child: Container(
                  height: 150,
                  width: 180,
                  decoration: BoxDecoration(
                      color: islike[5]
                          ? const Color.fromARGB(255, 232, 252, 255)
                          : const Color.fromARGB(255, 33, 208, 214),
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 100,
                          width: 100,
                          child: cakelist[createIndex]["Icons"][5],
                        ),
                        Text(cakelist[createIndex]["Cake1"][6],
                            style: GoogleFonts.inter(
                              fontSize: 16,
                            )),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          GestureDetector(
            onTap: () {
              if (createIndex < cakelist.length - 1) {
                createIndex++;
              }
              setState(() {});
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    if (createIndex > 0) {
                      createIndex--;
                    }
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
                      style:
                          GoogleFonts.inter(fontSize: 20, color: Colors.white),
                    )),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if (createIndex < cakelist.length - 1) {
                      createIndex++;
                    }
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
                      style:
                          GoogleFonts.inter(fontSize: 20, color: Colors.white),
                    )),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
