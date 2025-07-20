import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/address.dart';
import 'package:project/cookies.dart';

import 'package:project/homePage.dart';

import 'package:project/orderplaced.dart';
import 'package:project/sessionData.dart';
import 'package:sqflite/sqflite.dart';

class Basket extends StatefulWidget {
  const Basket({super.key});
  @override
  State<Basket> createState() => ProfileState();
}
// Future<Map<String, List<Map<String, dynamic>>>> getItems(Database db) async {
//   // Get all items from the database
//   final List<Map<String, dynamic>> items = await db.query('items');

//   // Categorize items into separate lists
//   Map<String, List<Map<String, dynamic>>> categorizedItems = {};

//   for (var item in items) {
//     String name = item['name'];
//     String description = item['description'];
//     String price = item['price'];
//     String imagepath = item['imagePath'];
//     String meassage = item['message'];
//     String weight = item['weight'];
//     if (categorizedItems.containsKey(name)&& categorizedItems.containsKey(description)&&
//     categorizedItems.containsKey(price)&& categorizedItems.containsKey(imagepath)&&
//      categorizedItems.containsKey(meassage)&&  categorizedItems.containsKey(weight)) {
//       categorizedItems[name]!.add(item);
//       categorizedItems[description]!.add(item);
//       categorizedItems[price]!.add(item);
//       categorizedItems[imagepath]!.add(item);
//       categorizedItems[meassage]!.add(item);
//       categorizedItems[weight]!.add(item);

//     } else {
//       categorizedItems[name] = [item];
//     }
//   }

//   return categorizedItems;
// }

class ProfileState extends State<Basket> {
  var subtotal = 0;
  List iscount = List.filled(5, 1);
  String receiverName = "";
  String phoneNo = "";

  Future<void> receiverData() async {
    log("FETCH  ADDRESS");
    DocumentSnapshot<Map<String, dynamic>> response = await FirebaseFirestore
        .instance
        .collection('Address')
        .doc(FirebaseAuth.instance.currentUser!.email)
        .get();
    receiverName = response['receiversName'];
    phoneNo = response['phoneNo'];

    log(receiverName);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      await receiverData();
    });
  }

  Future<List<Map<String, dynamic>>> getcart(Database db) async {
    return await db.query('items');
  }

  Future<void> calculateSubtotal(List<Map<String, dynamic>> cart) async {
    subtotal = 0;
    for (int i = 0; i < cart.length; i++) {
      int temp = cart[i]['price'] * iscount[i];
      subtotal += temp;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Basket",
          style: GoogleFonts.inter(fontSize: 25, fontWeight: FontWeight.w400),
        ),
        shape: const Border(
            bottom: BorderSide(
          color: Color.fromARGB(255, 230, 228, 228),
          width: 1,
        )),
        //centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                height: 60,
                width: 380,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: const Color.fromARGB(255, 255, 254, 254)),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 45,
                    ),
                    Image.asset("assets/clock1.png"),
                    const SizedBox(
                      width: 25,
                    ),
                    const Text(
                      "Delivery In 10-15 Min",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    )
                  ],
                ),
              ),
            ),
            FutureBuilder(
              future: initDatabase().then((db) async {
                List<Map<String, dynamic>> cartData = await getcart(db);
                log("$cartData");

                await calculateSubtotal(cartData);
                return cartData;
              }),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                  final cart = snapshot.data as List<Map<String, dynamic>>;

                  return Column(
                    children: [
                      const Center(
                        child: Text(
                          "ITEM'S ADDED",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w300,
                            fontSize: 22,
                          ),
                        ),
                      ),
                      ListView.builder(
                        controller: ScrollController(),
                        shrinkWrap: true,
                        itemCount: cart.length,
                        itemBuilder: (context, index) {
                          final addtocart = cart[index];
                          return Padding(
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
                                      child: Image.asset(addtocart['imagePath'],
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: SizedBox(
                                          width: 150,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                (addtocart['name']),
                                                style: GoogleFonts.inter(
                                                    fontSize: 18),
                                              ),
                                              Text(
                                                (addtocart['description']),
                                                style: GoogleFonts.inter(
                                                  fontSize: 14,
                                                  color: const Color.fromRGBO(
                                                      80, 80, 80, 1),
                                                ),
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    '₹${addtocart['price']}',
                                                    style: GoogleFonts.inter(
                                                      fontSize: 22,
                                                      color:
                                                          const Color.fromRGBO(
                                                              252, 120, 70, 1),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 15,
                                                  ),
                                                  Text(
                                                    '${addtocart['weight']}',
                                                    style: GoogleFonts.inter(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              if (iscount[index] > 1) {
                                                iscount[index]--;
                                              }

                                              setState(() {
                                                calculateSubtotal(cart);
                                              });
                                            },
                                            child: const Icon(
                                              Icons.remove_circle_outline,
                                              size: 28,
                                              color: Color.fromRGBO(
                                                  252, 120, 70, 1),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            "${iscount[index]}",
                                            style:
                                                const TextStyle(fontSize: 25),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                iscount[index]++;
                                                calculateSubtotal(cart);
                                              });
                                            },
                                            child: const Icon(
                                              Icons.add_circle_outline,
                                              size: 28,
                                              color: Color.fromRGBO(
                                                  252, 120, 70, 1),
                                            ),
                                          ),
                                        ],
                                      ),
                                      GestureDetector(
                                        onTap: () async {
                                          iscount[index] = 1;
                                          final db = await initDatabase();

                                          await db.delete('items',
                                              where: 'name = ?',
                                              whereArgs: [addtocart['name']]);
                                          subtotal = 0;
                                          setState(() {});
                                        },
                                        child: Container(
                                          margin: const EdgeInsets.all(16),
                                          height: 35,
                                          width: 70,
                                          decoration: BoxDecoration(
                                              color: const Color.fromRGBO(
                                                  254, 114, 76, 1),
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: Center(
                                              child: Text(
                                            "Remove",
                                            style: GoogleFonts.inter(
                                                fontSize: 15,
                                                color: Colors.white),
                                          )),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ); ////
                        },
                      ),
                      Container(
                        height: 50,
                        width: 380,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                        ),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    const HomePage(title: '')));
                          },
                          child: const Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(Icons.add_circle_outline_rounded),
                              ),
                              Text(
                                "Add More Items",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Spacer(),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(Icons.arrow_forward_ios_rounded),
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "BILL SUMMARY",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 160,
                        width: 380,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    "Sub Total",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                                const Spacer(),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    '₹$subtotal',
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    "Delivery",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                                Spacer(),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    "₹75",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const Divider(),
                            Row(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    "Delivery Total",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                const Spacer(),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "₹${subtotal + 75}",
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                      color: Color.fromRGBO(252, 120, 70, 1),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                }
                return Column(
                  children: [
                    const Center(
                      child: Text(
                        'No Items Added!',
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                    ),
                    Container(
                      height: 50,
                      width: 380,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const HomePage(title: '')));
                        },
                        child: const Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(Icons.add_circle_outline_rounded),
                            ),
                            Text(
                              "Add More Items",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Spacer(),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(Icons.arrow_forward_ios_rounded),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "BILL SUMMARY",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 160,
                      width: 380,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                      ),
                      child: const Column(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  "Sub Total",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              Spacer(),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  '₹ 0',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  "Delivery",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              Spacer(),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  "₹ 0",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Divider(),
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  "Delivery Total",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Spacer(),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  "₹ 0",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromRGBO(252, 120, 70, 1),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 80,
              width: 380,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const AddressDetailsScreen()));
                    },
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.fromLTRB(0, 10, 5, 5),
                              child: Text(
                                "Your Details",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Text(
                              receiverName,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              phoneNo,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(Icons.arrow_forward_ios_rounded),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () async {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Orderplaced()));
                setState(() {});
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
                      style:
                          GoogleFonts.inter(fontSize: 20, color: Colors.white),
                    ),
                  )),
            ),
            const SizedBox(
              height: 40,
            )
          ],
        ),
      ),
    );
  }
}
