import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:necter_app/beverages.dart';

class Explorescreen extends StatefulWidget {
  const Explorescreen({super.key});

  @override
  State<Explorescreen> createState() => _ExplorescreenState();
}

class _ExplorescreenState extends State<Explorescreen> {
  List<Map<String, dynamic>> product = [
    {
      "name": "Frash Fruits & Vegetable",
      "image": "assets/jpg/fruits.png",
      "color": const Color.fromRGBO(83, 177, 117, 0.7)
    },
    {
      "name": "Cooking Oil & Ghee",
      "image": "assets/jpg/cooking oil.png",
      "color": const Color.fromRGBO(248, 164, 76, 0.7),
    },
    {
      "name": "Meat & Fish",
      "image": "assets/jpg/meat.png",
      "color": const Color.fromRGBO(247, 165, 147, 1),
    },
    {
      "name": "Bakery & Snacks",
      "image": "assets/jpg/bakery.png",
      "color": const Color.fromRGBO(211, 176, 224, 1),
    },
    {
      "name": "Dairy & Eggs",
      "image": "assets/jpg/dairy.png",
      "color": const Color.fromRGBO(83, 177, 117, 0.1),
    },
    {
      "name": "Beverages",
      "image": "assets/jpg/beverages.png",
      "color": const Color.fromRGBO(253, 229, 152, 1)
    }
  ];
  List colorlist = [
    const Color.fromRGBO(83, 177, 117, 0.1),
    const Color.fromRGBO(248, 164, 76, 0.1),
    const Color.fromRGBO(247, 165, 147, 0.25),
    const Color.fromRGBO(211, 176, 224, 0.25),
    const Color.fromRGBO(253, 229, 152, 0.25),
    const Color.fromRGBO(183, 223, 245, 0.25)
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Find Products",
          style: GoogleFonts.dmSans(fontSize: 20, fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
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
                height: 20,
              ),
              GridView.builder(
                padding: const EdgeInsets.all(2),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.7,
                ),
                physics: const NeverScrollableScrollPhysics(),
                itemCount: product.length,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const Beverages()));
                  },
                  child: Container(
                    height: 250,
                    width: 175,
                    decoration: BoxDecoration(
                      color: colorlist[index % colorlist.length],
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: product[index]["color"] as Color,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(13.0),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                                child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: Image.asset(product[index]["image"]
                                    // product[index]["image"],
                                    ),
                              ),
                            )),
                            Text(
                              product[index]["name"],
                              textAlign: TextAlign.center,
                              style: GoogleFonts.dmSans(
                                  fontSize: 16, fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
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
