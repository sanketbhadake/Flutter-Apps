import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:project/createCake1.dart';
import 'package:project/createCake2.dart';
import 'package:project/createCake3.dart';
import 'package:project/createCake5.dart';
import 'package:project/createcake4.dart';
import 'package:project/orderplaced.dart';

// import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
//import 'package:project/cakelistModel.dart';
//import 'package:project/createCake2.dart';
String? totalamount;
String Name = " ";
String MobileNo = "";
String date = "";
String message = "";
final TextEditingController _emailcontroller = TextEditingController();
final TextEditingController _messagecontroller = TextEditingController();
final TextEditingController _datecontroller = TextEditingController();
List userChoices = [];
TextEditingController _dateController = TextEditingController();

class Createcake6 extends StatefulWidget {
  const Createcake6({
    super.key,
    /* required this.type,required this.shape,required this.serving,
  required this.tier,
  required this.flavour*/
  });
  /*final String type;
  final String shape;
  final String serving;
  final String tier;
   final String flavour;*/

  @override
  State<Createcake6> createState() => _Createcake6State();
}

class _Createcake6State extends State<Createcake6> {
  /*List<craeteCakeModel> cakelist1 = [
    craeteCakeModel(
      icons: Image.asset("assets/choocklet.png"),
      name: "Chocolate",
    ),
    craeteCakeModel(
      icons: Image.asset("assets/Dryfruits.png"),
      name: "Dryfruits",
    ),
    craeteCakeModel(
      icons: Image.asset("assets/vanila.png"),
      name: "Vannila",
    ),
    craeteCakeModel(
      icons: Image.asset("assets/butterscoch.png"),
      name: "Butterscotch",
    ),
    craeteCakeModel(
      icons: Image.asset("assets/blackcurrent.png"),
      name: "Black Currant",
    ),
    craeteCakeModel(
      icons: Image.asset("assets/pineapple.png"),
      name: "Pineapple",
    ),
  ];*/

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

  // This method will handle the date and time picker

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
          /*Container(
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
              )),*/
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  "Your Selected Options",
                  style: GoogleFonts.inter(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 8.0, 12, 8.0),
            child: Column(
              children: [
                Container(
                  height: 480,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.grey[200],
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView(
                          controller: ScrollController(),
                          padding: const EdgeInsets.all(16),
                          children: [
                            buildSummaryRow(
                                'Type',
                                cakelist1[userChoices[0]].name,
                                Icons.cake_outlined),
                                
                            buildSummaryRow(
                                'Shape',
                                cakelist2[userChoices[1]].name,
                                Icons.shape_line_outlined),
                            buildSummaryRow(
                                'Serving',
                                cakelist3[userChoices[2]].name,
                                Icons.scale_outlined),
                            buildSummaryRow(
                                'Tier',
                                cakelist4[userChoices[3]].name,
                                Icons.layers_outlined),
                            buildSummaryRow(
                                'Flavor',
                                cakelist5[userChoices[4]].name,
                                Icons.icecream_rounded),
                            const SizedBox(height: 16),
                            
                            TextField(
                              controller: _messagecontroller,
                              decoration: InputDecoration(
                                labelText: 'Message on Cake',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                            
                            const SizedBox(height: 16),
                            TextField(
                              controller: _dateController,
                              readOnly:
                                  true, // Disable editing to open the picker on tap
                              decoration: InputDecoration(
                                suffixIcon:
                                    const Icon(Icons.date_range_rounded),
                                labelText: 'Date Of Delivery',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),

                              onTap: () async {
                                DateTime? pickeddate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2024),
                                    lastDate: DateTime(2025));
                                String formatedDate =
                                    DateFormat.yMMMd().format(pickeddate!);

                                setState(() {
                                  _dateController.text = formatedDate;
                                });
                              },
                            ),
                            // Text(
                            //   'Selected Date & Time: ${_dateController.text}',
                            //   style: TextStyle(fontSize: 16),
                            // ),
                            const SizedBox(height: 16),
                            
                          ],
                          
                        ),
                      )
                      
                    ],
                    
                  ),
                  
                ),
                

                //      TextFormField(
                //   // enabled: false,
                //   readOnly: true,
                //   //controller: _dateController,
                //   decoration: InputDecoration(
                //     suffixIcon: const Icon(Icons.date_range_rounded),
                //     hintText: "Enter your D.O.B.",
                //     border: OutlineInputBorder(
                //       borderRadius: BorderRadius.circular(10),
                //     ),
                //   ),
                //   //keyboardType: null,
                //   //keyboardAppearance: null,
                //   validator: (value) {
                //     if (value == null || value.isEmpty) {
                //       return "Please enter your Date Of Birth";
                //     }
                //     return null;
                //   },
                //   onTap: () async {
                //     DateTime? pickeddate = await showDatePicker(
                //         context: context,
                //         initialDate: DateTime.now(),
                //         firstDate: DateTime(2024),
                //         lastDate: DateTime(2025));
                //     String formatedDate =
                //         DateFormat.yMMMd().format(pickeddate!);

                //     setState(() {
                //     //  _dateController.text = formatedDate;
                //     });
                //   },
                // ),
                Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: Container(
                    height: 55,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          const Text(
                            "Amount",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          const Spacer(),
                          // totalamount= cakelist1[userChoices[1]].price;
                          // cakelist1[userChoices[0]].price +
                          //               cakelist2[userChoices[1]].price +
                          //               cakelist3[userChoices[2]].price +
                          //               cakelist4[userChoices[3]].price +
                          //               cakelist5[userChoices[4]].price
                          // ;

                          Text(
                              totalamount = (cakelist1[userChoices[0]].price +
                                      cakelist2[userChoices[1]].price +
                                      cakelist3[userChoices[2]].price +
                                      cakelist4[userChoices[3]].price +
                                      cakelist5[userChoices[4]].price)
                                  .toString(),
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ),
                ),

                GestureDetector(
                  onTap: () async {
                    DocumentSnapshot<Map<String, dynamic>> response =
                        await FirebaseFirestore.instance
                            .collection("MyOrders")
                            .doc(FirebaseAuth.instance.currentUser!.email)
                            .get();

                    List temp = response.data()!['Orders'];
                    log("Length of Add - - - - -${temp.length}");
                    temp.add({
                      'Type': cakelist1[userChoices[0]].name,
                      'Shape': cakelist2[userChoices[1]].name,
                      'Serving': cakelist3[userChoices[2]].name,
                      'Tier': cakelist4[userChoices[3]].name,
                      'Flavor': cakelist5[userChoices[4]].name,
                      'message': _messagecontroller.text.trim(),
                      'date': _dateController.text.trim(),
                      'amount': totalamount,
                    });

                    await FirebaseFirestore.instance
                        .collection("MyOrders")
                        .doc(FirebaseAuth.instance.currentUser!.email)
                        .update({
                      'Orders': temp,
                    });

                    // firebase la order collection mdhye order add
                    // FirebaseFirestore.instance.collection('Orders').add({});
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Orderplaced()));
                  },
                  child: Container(
                      height: 44,
                      width: 370,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromRGBO(252, 120, 70, 1),
                      ),
                      child: Center(
                        child: Text(
                          "Place Order",
                          style: GoogleFonts.inter(
                              fontSize: 20, color: Colors.white),
                        ),
                      )),
                ),
              ],
            ),
          ),

          /*Row(
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
                  // Navigator.of(context).push(
                    // MaterialPageRoute(builder: (context) => Createcake6()));
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
          ),*/
        ],
      ),
    );
  }
}

Widget buildSummaryRow(String title, String value, IconData icon) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8),
    child: Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(color: Colors.grey, fontSize: 18),
              ),
              const SizedBox(height: 4),
              Text(
                value,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        const Spacer(),
        Icon(icon, color: Colors.teal, size: 28),
        const SizedBox(width: 16),
      ],
    ),
  );
}
