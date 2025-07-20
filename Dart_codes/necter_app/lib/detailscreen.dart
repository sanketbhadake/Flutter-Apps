import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class Detailscreen extends StatefulWidget {
  final String? image;
  final String? name;
  final int? price;
  final String? desc;

  const Detailscreen({
    super.key,
    required this.name,
    required this.image,
    required this.desc,
    required this.price,
  });

  @override
  State<Detailscreen> createState() => _DetailscreenState();
}

class _DetailscreenState extends State<Detailscreen> {
  int quantity = 1; // Quantity of the product
  bool isFavorite = false; // Track favorite state
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void increaseQuantity() {
    setState(() {
      quantity++;
    });
  }

  void decreaseQuantity() {
    if (quantity > 1) {
      setState(() {
        quantity--;
      });
    }
  }

  void addToBasket() {
    // Logic to add the product to the basket
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Center(
          child: Text(
            'Added ${widget.name} to basket',
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
  }

  // Toggle favorite state and add/remove from Firestore
  void toggleFavorite() async {
    setState(() {
      isFavorite = !isFavorite;
    });

    if (isFavorite) {
      // Add to Firestore
      await _firestore.collection('favorites').add({
        'name': widget.name,
        'image': widget.image,
        'price': widget.price,
        'desc': widget.desc,
        'timestamp': FieldValue.serverTimestamp(),
      });
    } else {
      // Remove from Firestore (optional: you can implement this logic if needed)
      // For example, you can query and delete the document based on the product name or ID.
    }
  }

  int calculateTotalPrice() {
    return widget.price! * quantity;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image Section
          Padding(
            padding: EdgeInsets.zero,
            child: Stack(
              children: [
                Container(
                  height: 375,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(242, 243, 242, 1),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25),
                    ),
                  ),
                  child: Image.asset(
                    "${widget.image}",
                    fit: BoxFit.contain,
                  ),
                ),
                // Back Icon
                Positioned(
                  top: 50,
                  left: 20,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: const Icon(
                      Icons.arrow_back_ios_new_outlined,
                      color: Colors.black,
                    ),
                  ),
                ),
                // Upload Icon
                const Positioned(
                  top: 50,
                  right: 20,
                  child: Icon(
                    Icons.drive_folder_upload_outlined,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          // Product Name and Favorite Icon
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${widget.name}",
                  style: GoogleFonts.dmSans(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                GestureDetector(
                  onTap: toggleFavorite, // Toggle favorite on tap
                  child: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color:
                        isFavorite ? Colors.red : Color.fromRGBO(94, 96, 94, 1),
                  ),
                ),
              ],
            ),
          ),
          // Product Description
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "${widget.desc}",
              style: GoogleFonts.dmSans(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: const Color.fromRGBO(124, 124, 124, 1),
              ),
            ),
          ),
          const SizedBox(height: 20),
          // Quantity Selector and Total Price
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                GestureDetector(
                  onTap: decreaseQuantity,
                  child: const Icon(Icons.remove),
                ),
                const SizedBox(width: 10),
                Container(
                  height: 46,
                  width: 46,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Center(child: Text("$quantity")),
                ),
                const SizedBox(width: 10),
                GestureDetector(
                  onTap: increaseQuantity,
                  child: const Icon(
                    Icons.add,
                    color: Color.fromRGBO(83, 177, 117, 1),
                  ),
                ),
                const Spacer(),
                Text(
                  "₹${calculateTotalPrice().toStringAsFixed(2)}", // Display total price
                  style: GoogleFonts.dmSans(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          // Product Detail Section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Product Detail",
              style: GoogleFonts.dmSans(
                fontSize: 17,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Apples are nutritious. Apples may be good for weight loss. Apples may be good for your heart. As part of a healthful and varied diet.\n\n"
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, but also the leap into electronic typesetting, remaining essentially unchanged.",
              style: GoogleFonts.dmSans(
                fontSize: 13,
                fontWeight: FontWeight.w400,
                color: const Color.fromRGBO(124, 124, 124, 1),
              ),
              textAlign: TextAlign.justify,
            ),
          ),
          const SizedBox(height: 30),
          // Add to Basket Button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: GestureDetector(
              onTap: addToBasket,
              child: Container(
                height: 67,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromRGBO(83, 177, 117, 1),
                ),
                child: Center(
                  child: Text(
                    "Add To Basket",
                    style: GoogleFonts.dmSans(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
