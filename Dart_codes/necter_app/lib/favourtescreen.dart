import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  List fav = [];
  bool isLoading = true; // Track loading state
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> getData() async {
    QuerySnapshot snapshot1 = await _firestore.collection('favorites').get();

    setState(() {
      fav = snapshot1.docs.map((doc) {
        var data = doc.data() as Map<String, dynamic>;
        data['id'] = doc.id; // Store the document ID for deletion
        if (data['quantity'] == null) {
          data['quantity'] = 1;
        }
        return data;
      }).toList();
      isLoading = false;
    });
    log("data:  ${fav.toString()}");
  }

  // Delete a favorite item from Firestore
  Future<void> deleteFavorite(String docId) async {
    await _firestore.collection('favorites').doc(docId).delete();
    // Refresh the list after deletion
    getData();
  }

  // Add all favorite items to the cart
  Future<void> addAllToCart() async {
    for (var item in fav) {
      await _firestore.collection('cart').add({
        'name': item['name'],
        'desc': item['desc'],
        'price': item['price'],
        'image': item['image'],
        'quantity': item['quantity'],
      });
    }
    // Optionally, you can show a snackbar or dialog to indicate success
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Center(
          child: Text(
            "All items added to cart!",
            style: GoogleFonts.dmSans(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: const Color.fromRGBO(83, 177, 117, 1), // Green color
        behavior: SnackBarBehavior.fixed, // Floating SnackBar
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10), // Rounded corners
        ),
        duration: const Duration(seconds: 2), // Display duration
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         automaticallyImplyLeading: false,
        title: Text(
          "Favourite",
          style: GoogleFonts.dmSans(fontSize: 20, fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: isLoading
                  ? ListView.builder(
                      itemCount: 5, // Number of shimmer placeholders
                      itemBuilder: (context, index) => Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: SizedBox(
                            height: 110,
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              children: [
                                Container(
                                  width: 100,
                                  height: 100,
                                  color: Colors.white, // Placeholder for image
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: double.infinity,
                                        height: 20,
                                        color: Colors
                                            .white, // Placeholder for name
                                      ),
                                      const SizedBox(height: 10),
                                      Container(
                                        width: double.infinity,
                                        height: 15,
                                        color: Colors
                                            .white, // Placeholder for description
                                      ),
                                    ],
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 60,
                                      height: 20,
                                      color:
                                          Colors.white, // Placeholder for price
                                    ),
                                    const SizedBox(width: 5),
                                    const Icon(
                                        Icons.arrow_forward_ios_outlined),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  : ListView.builder(
                      itemCount: fav.length,
                      itemBuilder: (context, index) => Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: SizedBox(
                              height: 110,
                              width: MediaQuery.of(context).size.width,
                              child: Row(
                                children: [
                                  Image.asset(fav[index]["image"]),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "${fav[index]["name"]}",
                                          style: GoogleFonts.dmSans(
                                              fontSize: 17,
                                              fontWeight: FontWeight.w700),
                                        ),
                                        Text(
                                          "${fav[index]["desc"]}",
                                          style: GoogleFonts.dmSans(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700,
                                            color: const Color.fromRGBO(
                                                124, 124, 124, 1),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            "₹${fav[index]["price"]}",
                                            style: GoogleFonts.dmSans(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          const Icon(
                                              Icons.arrow_forward_ios_outlined),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          // Delete the favorite item
                                          deleteFavorite(fav[index]["id"]);
                                        },
                                        child: const Icon(
                                          Icons.favorite,
                                          color: Colors.red,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const Divider(
                            color: Color.fromARGB(113, 158, 158, 158),
                            thickness: 1.0,
                            height: 1.0,
                            indent: 10,
                            endIndent: 10,
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
            ),
            GestureDetector(
              onTap: () {
                // Add all favorite items to the cart
                addAllToCart();
              },
              child: Container(
                height: 70,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromRGBO(83, 177, 117, 1),
                ),
                child: Center(
                  child: Text(
                    "Add All To Cart",
                    style: GoogleFonts.dmSans(
                      fontSize: 19,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
