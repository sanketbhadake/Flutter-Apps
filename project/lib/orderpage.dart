import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/cookies.dart';
import 'package:sqflite/sqlite_api.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  List myorder = [];
  List firebaseOrderList = [];

  Future<void> getcart() async {
    Database db = await initDatabase();

    List<Map<String, dynamic>> data = await db.query('items');

    myorder = data;

    setState(() {});

    log("CART DATA: ${myorder}");
  }

  // String type = " ";
  // String Flavor = " ";
  // String Tier = "";
  // String Serving = "";
  // String Shape = "";
  // String date = "";
  // String message = "";
  // String amount = "";

  Future<void> receiverData() async {
    DocumentSnapshot<Map<String, dynamic>> response = await FirebaseFirestore
        .instance
        .collection('MyOrders')
        .doc(FirebaseAuth.instance.currentUser!.email)
        .get();

    for (int i = 0; i < response.data()!['Orders'].length; i++) {
      firebaseOrderList.add({
        'Type': response.data()!['Orders'][i]['Type'],
        'Shape': response.data()!['Orders'][i]['Shape'],
        'Serving': response.data()!['Orders'][i]['Serving'],
        'Tier': response.data()!['Orders'][i]['Tier'],
        'Flavor': response.data()!['Orders'][i]['Flavor'],
        'message': response.data()!['Orders'][i]['message'],
        'date': response.data()!['Orders'][i]['date'],
        'amount': response.data()!['Orders'][i]['amount']
      });
    }

    setState(() {});

    log("data recieved");
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      await receiverData();
    });

    Future.delayed(Duration(seconds: 0), () async {
      await getcart();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          "Order",
          style: GoogleFonts.inter(fontSize: 25),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              itemCount: firebaseOrderList.length,
              controller: ScrollController(),
              itemBuilder: (context, index) => Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 250,
                      width: MediaQuery.of(context).size.width,
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: Text(
                              "Customize cake",
                              style: GoogleFonts.inter(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 15.0, top: 10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "Type: ",
                                          style: GoogleFonts.inter(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Text(
                                          "${firebaseOrderList[index]['Type']}",
                                          style: GoogleFonts.inter(
                                            fontSize: 18,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "Shape:  ",
                                          style: GoogleFonts.inter(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Text(
                                          "Shape${firebaseOrderList[index]['Shape']}",
                                          style: GoogleFonts.inter(
                                            fontSize: 17,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "Serving: ",
                                          style: GoogleFonts.inter(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Text(
                                          "${firebaseOrderList[index]['Serving']}",
                                          style: GoogleFonts.inter(
                                            fontSize: 17,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "Tier: ",
                                          style: GoogleFonts.inter(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Text(
                                          "${firebaseOrderList[index]['Tier']}",
                                          style: GoogleFonts.inter(
                                            fontSize: 17,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "Flavor: ",
                                          style: GoogleFonts.inter(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Text(
                                          "${firebaseOrderList[index]['Flavor']}",
                                          style: GoogleFonts.inter(
                                            fontSize: 17,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text('Message: ',
                                            style: GoogleFonts.inter(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600)),
                                        Text(
                                          "${firebaseOrderList[index]['message']}",
                                          style: GoogleFonts.inter(
                                            fontSize: 17,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text('Date: ',
                                            style: GoogleFonts.inter(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600)),
                                        Text(
                                          "${firebaseOrderList[index]['date']}",
                                          style: GoogleFonts.inter(
                                            fontSize: 17,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text('Amount: ',
                                            style: GoogleFonts.inter(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600)),
                                        Text(
                                            "₹${firebaseOrderList[index]['amount']}",
                                            style: GoogleFonts.inter(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold,
                                              color: const Color.fromRGBO(
                                                  252, 120, 70, 1),
                                            )),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Spacer(),
                              Container(
                                margin: const EdgeInsets.all(16),
                                height: 40,
                                width: 65,
                                decoration: BoxDecoration(
                                    color:
                                        const Color.fromARGB(255, 27, 161, 0),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(
                                  child: Text(
                                    "ORDERED",
                                    style: GoogleFonts.inter(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          // Column(
                          //   crossAxisAlignment: CrossAxisAlignment.center,
                          //   mainAxisAlignment: MainAxisAlignment.center,
                          //   children: [
                          //     Container(
                          //       margin: const EdgeInsets.all(16),
                          //       height: 40,
                          //       width: 65,
                          //       decoration: BoxDecoration(
                          //           color:
                          //               const Color.fromARGB(255, 27, 161, 0),
                          //           borderRadius: BorderRadius.circular(10)),
                          //       child: Center(
                          //         child: Text(
                          //           "ORDERED",
                          //           style: GoogleFonts.inter(
                          //               fontSize: 13,
                          //               fontWeight: FontWeight.w600,
                          //               color: Colors.white),
                          //         ),
                          //       ),
                          //     ),
                          //   ],
                          // )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: myorder.length,
              controller: ScrollController(),
              itemBuilder: (context, index) => Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 140,
                      width: MediaQuery.of(context).size.width,
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
                        mainAxisAlignment: MainAxisAlignment.center,
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
                              child: Image.asset(myorder[index]["imagePath"],
                                  fit: BoxFit.cover),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        (myorder[index]['name']),
                                        style: GoogleFonts.inter(fontSize: 18),
                                      ),
                                      Text(myorder[index]["description"],
                                          style: GoogleFonts.inter(
                                              fontSize: 14,
                                              color: const Color.fromRGBO(
                                                  80, 80, 80, 1))),
                                      Text(
                                        '₹${myorder[index]["price"]}',
                                        style: GoogleFonts.inter(
                                          fontSize: 22,
                                          color: const Color.fromRGBO(
                                              252, 120, 70, 1),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                margin: const EdgeInsets.all(16),
                                height: 40,
                                width: 65,
                                decoration: BoxDecoration(
                                    color:
                                        const Color.fromARGB(255, 27, 161, 0),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(
                                    child: Text(
                                  "ORDERED",
                                  style: GoogleFonts.inter(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white),
                                )),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      // Column(
      //   children: [
      //     Center(
      //       child: Image.asset(
      //         "assets/tracking.png",
      //         height: 320,
      //         width: 320,
      //       ),
      //     ),
      //     Text(
      //       "No Orders Yet",
      //       style: GoogleFonts.inter(fontSize: 25, fontWeight: FontWeight.w500),
      //     ),
      //     GestureDetector(
      //       onTap: () {
      //         Navigator.push(
      //             context,
      //             MaterialPageRoute(
      //                 builder: (context) => const HomePage(
      //                       title: "",
      //                     )));
      //       },
      //       child: Container(
      //         margin: const EdgeInsets.all(16),
      //         height: 45,
      //         width: 300,
      //         decoration: BoxDecoration(
      //             color: const Color.fromRGBO(254, 114, 76, 1),
      //             borderRadius: BorderRadius.circular(10)),
      //         child: Center(
      //             child: Text(
      //           "Order Now",
      //           style: GoogleFonts.inter(fontSize: 20, color: Colors.white),
      //         )),
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}
