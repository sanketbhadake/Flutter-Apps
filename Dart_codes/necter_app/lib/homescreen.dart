import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:necter_app/detailscreen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shimmer/shimmer.dart';

List exclusive = [];

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List dataList1 = [];
  List dataList2 = [];
  List dataList3 = [];
  bool isLoading = true;

  Future<void> getData() async {
    QuerySnapshot snapshot1 = await _firestore.collection('items').get();
    QuerySnapshot snapshot2 = await _firestore.collection('bestselling').get();
    QuerySnapshot snapshot3 = await _firestore.collection('other').get();

    setState(() {
      dataList1 = snapshot1.docs;
      dataList2 = snapshot2.docs;
      dataList3 = snapshot3.docs;
      isLoading = false;
    });
    log("data:  ${dataList1.toString()}");
  }

  Future<void> addToCart(
      Map<String, dynamic> item, BuildContext context) async {
    try {
      // Add the item to the 'cart' collection in Firestore
      await _firestore.collection('cart').add({
        'name': item['name'],
        'desc': item['desc'],
        'price': item['price'],
        'image': item['image'],
        'quantity': 1, // Default quantity
        'timestamp':
            FieldValue.serverTimestamp(), // Add a timestamp for sorting
      });
      log("Item added to cart: ${item['name']}");

      // Show a SnackBar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Center(
            child: Text(
              "Successfully Added To Cart..!",
              style: GoogleFonts.dmSans(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
          backgroundColor: const Color.fromRGBO(83, 177, 117, 1), // Green color
          behavior: SnackBarBehavior.floating, // Floating SnackBar
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10), // Rounded corners
          ),
          duration: const Duration(seconds: 2), // Display duration
        ),
      );
    } catch (e) {
      log("Error adding item to cart: $e");
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  List grocerise = [
    "assets/jpg/pulse.png",
    "assets/jpg/ring.png",
  ];
  int currentIndex = 0;
  List banner = [
    "assets/jpg/banner.png",
    "assets/jpg/banner.png",
    "assets/jpg/banner.png",
    "assets/jpg/banner.png"
  ];

  Widget buildShimmerEffect() {
    return GridView.builder(
      padding: const EdgeInsets.all(2),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.68,
      ),
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 4, // Number of shimmer placeholders
      itemBuilder: (context, index) => Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Container(
          height: 250,
          width: 175,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              SvgPicture.asset("assets/svg/carrot.svg"),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.location_on,
                    color: Color.fromRGBO(86, 86, 86, 1),
                  ),
                  Text("Pune, Maharashtra",
                      style: GoogleFonts.dmSans(
                          fontSize: 18,
                          color: const Color.fromRGBO(86, 86, 86, 1),
                          fontWeight: FontWeight.w700)),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 53,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: const Color.fromARGB(75, 101, 102, 101)),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search Store",
                    prefixIcon: const Icon(
                      Icons.search,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  CarouselSlider.builder(
                    itemCount: banner.length,
                    itemBuilder: (context, index, realindex) => SizedBox(
                      height: 115,
                      width: 370,
                      child: Image.asset(banner[index]),
                    ),
                    options: CarouselOptions(
                      onPageChanged: (index, reason) => setState(() {
                        currentIndex = index;
                      }),
                      height: 100,
                      viewportFraction: 0.9,
                      autoPlay: true,
                      enlargeCenterPage: true,
                      autoPlayAnimationDuration: const Duration(seconds: 1),
                    ),
                  ),
                  Positioned(
                    bottom: 9,
                    child: SmoothPageIndicator(
                      controller: PageController(
                        initialPage: currentIndex,
                      ),
                      count: banner.length,
                      effect: const ExpandingDotsEffect(
                        activeDotColor: Color.fromRGBO(83, 177, 117, 1),
                        dotHeight: 8,
                        dotWidth: 5,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Exclusive Offers",
                    style: GoogleFonts.dmSans(
                        fontSize: 24, fontWeight: FontWeight.w700),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "See all",
                        style: GoogleFonts.dmSans(
                            fontSize: 16,
                            color: const Color.fromRGBO(83, 177, 117, 1)),
                      ))
                ],
              ),
              isLoading
                  ? buildShimmerEffect()
                  : GridView.builder(
                      padding: const EdgeInsets.all(2),
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        childAspectRatio: 0.68,
                      ),
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: dataList1.length,
                      itemBuilder: (context, index) => GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Detailscreen(
                                    name: dataList1[index]["name"],
                                    desc: dataList1[index]["desc"],
                                    image: dataList1[index]["image"],
                                    price: dataList1[index]["price"],
                                  )));
                        },
                        child: Container(
                          height: 250,
                          width: 175,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: const Color.fromRGBO(226, 226, 226, 0.7),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(13.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Center(
                                    child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                      height: 100,
                                      width: 100,
                                      child: Image.asset(
                                        "${dataList1[index]['image']}",
                                      )),
                                )),
                                Text(
                                  dataList1[index]['name'],
                                  style: GoogleFonts.dmSans(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700),
                                ),
                                Text(
                                  dataList1[index]['desc'],
                                  style: GoogleFonts.dmSans(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      color: const Color.fromRGBO(
                                          124, 124, 124, 1)),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "₹${dataList1[index]['price']}.00",
                                      style: GoogleFonts.dmSans(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    const Spacer(),
                                    GestureDetector(
                                      onTap: () {
                                        Map<String, dynamic> itemData =
                                            dataList1[index].data()
                                                as Map<String, dynamic>;
                                        // Add the item to the cart
                                        addToCart(itemData, context);
                                      },
                                      child: Container(
                                        height: 46,
                                        width: 46,
                                        decoration: BoxDecoration(
                                            color: const Color.fromRGBO(
                                                83, 177, 117, 1),
                                            borderRadius:
                                                BorderRadius.circular(18)),
                                        child: const Icon(Icons.add,
                                            color: Colors.white),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Best Selling",
                    style: GoogleFonts.dmSans(
                        fontSize: 24, fontWeight: FontWeight.w700),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "See all",
                        style: GoogleFonts.dmSans(
                            fontSize: 16,
                            color: const Color.fromRGBO(83, 177, 117, 1)),
                      ))
                ],
              ),
              isLoading
                  ? buildShimmerEffect()
                  : GridView.builder(
                      padding: const EdgeInsets.all(2),
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        childAspectRatio: 0.68,
                      ),
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: dataList2.length,
                      itemBuilder: (context, index) => GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Detailscreen(
                                    name: dataList2[index]["name"],
                                    desc: dataList1[index]["desc"],
                                    image: dataList2[index]["image"],
                                    price: dataList2[index]["price"],
                                  )));
                        },
                        child: Container(
                          height: 250,
                          width: 175,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: const Color.fromRGBO(226, 226, 226, 0.7),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(13.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Center(
                                    child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                      height: 100,
                                      width: 100,
                                      child: Image.asset(
                                        "${dataList2[index]['image']}",
                                      )),
                                )),
                                Text(
                                  dataList2[index]['name'],
                                  style: GoogleFonts.dmSans(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700),
                                ),
                                Text(
                                  dataList2[index]['desc'],
                                  style: GoogleFonts.dmSans(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      color: const Color.fromRGBO(
                                          124, 124, 124, 1)),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "₹${dataList2[index]['price']}.00",
                                      style: GoogleFonts.dmSans(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    const Spacer(),
                                    GestureDetector(
                                      onTap: () {
                                        Map<String, dynamic> itemData =
                                            dataList2[index].data()
                                                as Map<String, dynamic>;
                                        // Add the item to the cart
                                        addToCart(itemData, context);
                                      },
                                      child: Container(
                                        height: 46,
                                        width: 46,
                                        decoration: BoxDecoration(
                                            color: const Color.fromRGBO(
                                                83, 177, 117, 1),
                                            borderRadius:
                                                BorderRadius.circular(18)),
                                        child: const Icon(Icons.add,
                                            color: Colors.white),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Grocerise",
                    style: GoogleFonts.dmSans(
                        fontSize: 24, fontWeight: FontWeight.w700),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "See all",
                      style: GoogleFonts.dmSans(
                          fontSize: 16,
                          color: const Color.fromRGBO(83, 177, 117, 1)),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 107,
                child: ListView.builder(
                    itemCount: grocerise.length,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 250,
                            height: 105,
                            decoration: BoxDecoration(
                                color: const Color.fromRGBO(248, 164, 76, 1),
                                borderRadius: BorderRadius.circular(18)),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Row(
                                children: [
                                  Image.asset(grocerise[index]),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "Pulses",
                                    style: GoogleFonts.dmSans(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )),
              ),
              const SizedBox(
                height: 20,
              ),
              isLoading
                  ? buildShimmerEffect()
                  : GridView.builder(
                      padding: const EdgeInsets.all(2),
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        childAspectRatio: 0.68,
                      ),
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: dataList3.length,
                      itemBuilder: (context, index) => GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Detailscreen(
                                    name: dataList3[index]["name"],
                                    image: dataList3[index]["image"],
                                    price: dataList3[index]["price"],
                                    desc: dataList3[index]["desc"],
                                  )));
                        },
                        child: Container(
                          height: 250,
                          width: 175,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: const Color.fromRGBO(226, 226, 226, 0.7),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(13.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Center(
                                    child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                      height: 100,
                                      width: 100,
                                      child: Image.asset(
                                        "${dataList3[index]['image']}",
                                      )),
                                )),
                                Text(
                                  dataList3[index]['name'],
                                  style: GoogleFonts.dmSans(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700),
                                ),
                                Text(
                                  dataList3[index]['desc'],
                                  style: GoogleFonts.dmSans(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      color: const Color.fromRGBO(
                                          124, 124, 124, 1)),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "₹${dataList3[index]['price']}.00",
                                      style: GoogleFonts.dmSans(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    const Spacer(),
                                    GestureDetector(
                                      onTap: () {
                                        Map<String, dynamic> itemData =
                                            dataList3[index].data()
                                                as Map<String, dynamic>;
                                        // Add the item to the cart
                                        addToCart(itemData, context);
                                      },
                                      child: Container(
                                        height: 46,
                                        width: 46,
                                        decoration: BoxDecoration(
                                            color: const Color.fromRGBO(
                                                83, 177, 117, 1),
                                            borderRadius:
                                                BorderRadius.circular(18)),
                                        child: const Icon(Icons.add,
                                            color: Colors.white),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
