import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Details extends StatefulWidget {
  final String image;
  final String price;
  final String name;

  const Details(
      {super.key,
      required this.name,
      required this.image,
      required this.price});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  List<dynamic> size = ['S', 'M', 'L', 'XL', 'XXL'];
  String selectedSize = 'M';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [const Icon(Icons.drafts_sharp)],
        title: Text(
          "Details",
          style: GoogleFonts.imprima(fontSize: 20, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: const Icon(Icons.arrow_back_ios_new)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: SizedBox(
                height: 420,
                width: 320,
                child: Image.asset(
                  widget.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.name,
                style: GoogleFonts.imprima(
                    fontSize: 32, fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Size",
              style: GoogleFonts.imprima(
                  fontSize: 26, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 60,
              child: ListView.builder(
                itemCount: size.length,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedSize = size[index]; // Update selected size
                      });
                    },
                    child: Container(
                      height: 50,
                      width: 60,
                      decoration: BoxDecoration(
                        color: selectedSize == size[index]
                            ? Colors.black
                            : Colors.grey[200],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          size[index],
                          style: TextStyle(
                            fontSize: 25,
                            color: selectedSize == size[index]
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const Spacer(),
            Row(
              children: [
                Text("\$${widget.price}",
                    style: GoogleFonts.imprima(
                        fontSize: 38, fontWeight: FontWeight.w600)),
                const Spacer(),
                Container(
                  height: 65,
                  width: 170,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(95),
                      color: const Color.fromRGBO(255, 122, 0, 1)),
                  child: Center(
                    child: Text(
                      "Add To Cart",
                      style: GoogleFonts.imprima(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
