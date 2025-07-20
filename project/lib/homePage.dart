import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/cart.dart';
import 'package:project/cookies.dart';
import 'package:project/location.dart';
import 'package:project/searchbar.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({super.key, required this.title});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, String>> cakeList1 = [
    {
      "name": "Choco Fountain",
      "price": "750",
      "image": "assets/overloaded/1.jpg",
      "description": "Loaded with chocolate donuts"
    },
    {
      "name": "Oreo Fountain",
      "price": "800",
      "image": "assets/overloaded/2.jpg",
      "description": "Filled with oreo crunch and donuts",
    },
    {
      "name": "Milky Fountain",
      "price": "550",
      "image": "assets/overloaded/3.jpg",
      "description": "Loaded with chocolaty milk delight",
    },
    {
      "name": "Candy Tower",
      "price": "600",
      "image": "assets/overloaded/4.jpg",
      "description": "Topped with candies and strawberry delight",
    },
  ];
  final List<Map<String, String>> cakeList2 = [
    {
      "name": "Vibrant Blue",
      "price": "600",
      "image": "assets/blue/1.jpg",
      "description": "Vanilla flavoured creamy delight"
    },
    {
      "name": "Blue Chocolate",
      "price": "750",
      "image": "assets/blue/2.jpg",
      "description": "Chocolate oreo topping with jewels"
    },
    {
      "name": "Golden Jewels",
      "price": "800",
      "image": "assets/blue/3.jpg",
      "description": "Golden treasure delight with chocolate burst "
    },
    {
      "name": "Vintage Blue",
      "price": "650",
      "image": "assets/blue/4.jpg",
      "description": "Delightful vanilla flavoured whipped cream"
    },
  ];
  final List<Map<String, String>> cakeList3 = [
    {
      "name": "Creamy Frost ",
      "price": "650",
      "image": "assets/pink/1.jpg",
      "description": "Angelic vanilla delight topped with pearls"
    },
    {
      "name": "Sweet Symphony",
      "price": "640",
      "image": "assets/pink/2.jpg",
      "description": "White chocolate toppings with creamy strawberry"
    },
    {
      "name": "Vibrant Pink",
      "price": "700",
      "image": "assets/pink/3.jpg",
      "description": "Topped with princesses crown"
    },
    {
      "name": "Fluffy Pink",
      "price": "600",
      "image": "assets/pink/4.jpg",
      "description": "White chocolate garden with rose flowers"
    },
  ];
  final List<Map<String, String>> cakeList4 = [
    {
      "name": "Drunk Barbie",
      "price": "750",
      "image": "assets/barbie/1.jpg",
      "description": "Overflow of candies and strawberry cream"
    },
    {
      "name": "Party Frost",
      "price": "770",
      "image": "assets/barbie/2.jpg",
      "description": "Dripping with strawberry cream"
    },
    {
      "name": "Candies Overloaded",
      "price": "800",
      "image": "assets/barbie/3.jpg",
      "description": "Topped with barbie and balloons"
    },
    {
      "name": "Waffers & Candy",
      "price": "790",
      "image": "assets/barbie/4.jpg",
      "description": "Dripping candies and waffers with Partying barbie"
    },
  ];
  final List<Map<String, String>> cakeList5 = [
    {
      "name": "Glittering Heart",
      "price": "550",
      "image": "assets/heart/1.jpg",
      "description": "Wrapped with edible blue glitter"
    },
    {
      "name": "Glamour Cake",
      "price": "600",
      "image": "assets/heart/2.jpg",
      "description": "Topped with a glamourous Crown"
    },
    {
      "name": "Tender Heart",
      "price": "570",
      "image": "assets/heart/3.jpg",
      "description": "Sweet Strawberry and vanilla delight"
    },
    {
      "name": "Enchanting Butterflies",
      "price": "650",
      "image": "assets/heart/4.jpg",
      "description": "Topped with pearls and butterflies"
    },
    {
      "name": "Delecious Bloom",
      "price": "600",
      "image": "assets/heart/5.jpg",
      "description": "Bloom of butterscotch and flavoues on top"
    },
    {
      "name": "Creamy Heart",
      "price": "590",
      "image": "assets/heart/6.jpg",
      "description": "Flavoured with strawberry and lavender"
    },
    {
      "name": "Vintage Heart",
      "price": "550",
      "image": "assets/heart/7.jpg",
      "description": "Lavender flavoured whipped cream"
    },
    {
      "name": "Dancing Butterflies",
      "price": "610",
      "image": "assets/heart/8.jpg",
      "description": "strawberry flavoured whipped cream",
    },
  ];

  void _showCakeDetails(BuildContext context, Map<String, String> cake) {
    String selectweight = '';
    TextEditingController messageController = TextEditingController();
    final viewInsets = MediaQuery.of(context).viewInsets;
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (_) {
        return SingleChildScrollView(
          child: StatefulBuilder(
            builder: (BuildContext context, StateSetter setModalState) =>
                Padding(
              padding: EdgeInsets.only(bottom: viewInsets.bottom),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 500,
                    height: 70,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 233, 233, 227),
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            cake["name"] ?? "",
                            style: TextStyle(
                                fontSize: 16, color: Colors.grey[600]),
                          ),
                          Expanded(
                            child: SizedBox(
                              child: Text(cake["description"] ?? "",
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        const SizedBox(height: 16.0),
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Select Weight',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ChoiceChip(
                              label: const Text("0.5KG"),
                              selected: selectweight == '0.5KG',
                              onSelected: (selected) {
                                setModalState(() {
                                  selectweight = '0.5KG';
                                });
                              },
                            ),
                            ChoiceChip(
                              label: const Text("1KG"),
                              selected: selectweight == '1KG',
                              onSelected: (selected) {
                                setModalState(() {
                                  selectweight = '1KG';
                                });
                              },
                            ),
                            ChoiceChip(
                              label: const Text("2KG"),
                              selected: selectweight == '2KG',
                              onSelected: (selected) {
                                setModalState(() {
                                  selectweight = '2KG';
                                });
                              },
                            ),
                          ],
                        ),
                        const SizedBox(height: 16.0),
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Cake Message',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        TextField(
                          controller: messageController,
                          maxLength: 25,
                          decoration: const InputDecoration(
                            hintText: 'Enter message on cake',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 16.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Item Total',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '₹ ${cake['price']}',
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 25.0),
                  GestureDetector(
                    onTap: () async {
                      final db = await initDatabase();

                      await addTocart(
                        db,
                        {
                          'name': cake['name'],
                          'description': cake['description'],
                          'price': cake['price'],
                          'imagePath': cake['image'],
                          'message': messageController.text.trim(),
                          'weight': selectweight
                        },
                      );

                      Navigator.of(context).pop();

                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => const Basket(),
                      //   ),
                      // );
                    },
                    child: Container(
                      margin: const EdgeInsets.all(16),
                      height: 45,
                      width: 180,
                      decoration: BoxDecoration(
                          color: const Color.fromRGBO(254, 114, 76, 1),
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                          child: Text(
                        "Add to Cart",
                        style: GoogleFonts.inter(
                            fontSize: 18, color: Colors.white),
                      )),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  List imageslist = [
    Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      height: 300,
      width: 380,
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(84, 0, 0, 0),
            spreadRadius: 0,
            blurRadius: 10,
            offset: Offset(0, 3),
          ),
        ],
        // color: Colors.amber,
        borderRadius: BorderRadius.circular(20),
      ),
      clipBehavior: Clip.antiAlias,
      child: Image.asset(
        "assets/highlight/2.jpg",
        fit: BoxFit.cover,
      ),
    ),
    Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      height: 300,
      width: 380,
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(84, 0, 0, 0),
            spreadRadius: 0,
            blurRadius: 10,
            offset: Offset(0, 3),
          ),
        ],
        // color: Colors.amber,
        borderRadius: BorderRadius.circular(20),
      ),
      clipBehavior: Clip.antiAlias,
      child: Image.asset(
        "assets/highlight/3.jpg",
        fit: BoxFit.cover,
      ),
    ),
    Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      height: 300,
      width: 380,
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(84, 0, 0, 0),
            spreadRadius: 0,
            blurRadius: 10,
            offset: Offset(0, 3),
          ),
        ],
        // color: Colors.amber,
        borderRadius: BorderRadius.circular(20),
      ),
      clipBehavior: Clip.antiAlias,
      child: Image.asset(
        "assets/highlight/4.jpg",
        fit: BoxFit.cover,
      ),
    ),
    Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      height: 300,
      width: 380,
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(84, 0, 0, 0),
            spreadRadius: 0,
            blurRadius: 10,
            offset: Offset(0, 3),
          ),
        ],
        // color: Colors.amber,
        borderRadius: BorderRadius.circular(20),
      ),
      clipBehavior: Clip.antiAlias,
      child: Image.asset(
        "assets/highlight/5.jpg",
        fit: BoxFit.cover,
      ),
    ),
    Container(
      margin: const EdgeInsets.symmetric(
        vertical: 15,
      ),
      height: 300,
      width: 380,
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(84, 0, 0, 0),
            spreadRadius: 0,
            blurRadius: 10,
            offset: Offset(0, 3),
          ),
        ],
        // color: Colors.amber,
        borderRadius: BorderRadius.circular(20),
      ),
      clipBehavior: Clip.antiAlias,
      child: Image.asset(
        "assets/highlight/4.jpg",
        fit: BoxFit.cover,
      ),
    ),
    Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      height: 300,
      width: 380,
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(84, 0, 0, 0),
            spreadRadius: 0,
            blurRadius: 10,
            offset: Offset(0, 3),
          ),
        ],
        color: Colors.amber,
        borderRadius: BorderRadius.circular(20),
      ),
      clipBehavior: Clip.antiAlias,
      child: Image.asset(
        "assets/highlight/1.png",
        fit: BoxFit.cover,
      ),
    ),
  ];
  int cureentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 60,
            ),
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Icon(
                    Icons.location_on,
                    color: Color.fromRGBO(252, 120, 70, 1),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SelectCityPage()),
                    );
                  },
                  child: Text(
                    "Deliver To",
                    style: GoogleFonts.inter(fontSize: 18),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SelectCityPage()),
                    );
                  },
                  child: const Icon(
                    Icons.keyboard_arrow_down_sharp,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50.0),
              child: Text(
                widget.title,
                style: GoogleFonts.inter(
                    fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Searchbar()));
                  setState(() {});
                },
                child: Container(
                  height: 54,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Color.fromRGBO(252, 120, 70, 1),
                        width: 1.5), // Border color and width
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Find Your Craving",
                        style: GoogleFonts.inter(
                          fontSize: 18,
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Icon(Icons.search),
                      ),
                    ],
                  ),
                ),
                // child: TextField(
                //   decoration: InputDecoration(
                //     suffixIcon: GestureDetector(
                //         onTap: () {
                //           Navigator.of(context).push(MaterialPageRoute(
                //               builder: (context) => Searchbar()));
                //           setState(() {});
                //         },
                //         child: const Icon(Icons.search)),
                //     border: OutlineInputBorder(
                //         borderRadius: BorderRadius.circular(20)),
                //     hintText: "Find Your Craving",
                //     hintStyle: GoogleFonts.inter(fontSize: 18),
                //     enabledBorder: OutlineInputBorder(
                //       borderRadius: BorderRadius.circular(20),
                //       borderSide: const BorderSide(
                //           color: Color.fromRGBO(254, 114, 76, 1), width: 1),
                //     ),
                //   ),
                // ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                "Today’s Best Deals",
                style: GoogleFonts.inter(fontSize: 28),
              ),
            ),
            CarouselSlider.builder(
              itemCount: imageslist.length,
              itemBuilder: (context, index, realIndex) {
                return imageslist[index];
              },
              options: CarouselOptions(
                height: 300,
                autoPlay: true,
                autoPlayAnimationDuration: const Duration(seconds: 1),
                enlargeCenterPage: true,
                onPageChanged: (index, reason) {
                  setState(() {
                    cureentIndex = index;
                  });
                },
              ),
            ),
            Center(
              child: SmoothPageIndicator(
                  controller: PageController(initialPage: cureentIndex),
                  count: imageslist.length,
                  effect: const ScrollingDotsEffect(
                    activeDotColor: Color.fromRGBO(252, 120, 70, 1),
                    dotHeight: 12,
                    dotWidth: 12,
                  ),
                  onDotClicked: (index) {}),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, top: 10),
              child: Text(
                "Overloaded Cakes",
                style: GoogleFonts.inter(fontSize: 28),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: GridView.builder(
                padding: const EdgeInsets.only(top: 8),
                //scrollDirection: Axis.vertical,
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: cakeList1.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 15,
                  childAspectRatio: 0.7,
                ),
                itemBuilder: (ctx, index) {
                  final cake = cakeList1[index];
                  return GestureDetector(
                    onTap: () => _showCakeDetails(context, cake),
                    child: Container(
                      height: 200,
                      width: 100,
                      decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromARGB(55, 0, 0, 0),
                              spreadRadius: 0,
                              blurRadius: 8,
                              offset: Offset(0, 2),
                            ),
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      clipBehavior: Clip.antiAlias,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            cake["image"] ?? "",
                            fit: BoxFit.cover,
                            height: 160,
                            width: 240,
                          ),
                          const Spacer(),
                          // SvgPicture.asset("assets/svg/cake1.svg"),
                          Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Text(cake["name"] ?? "",
                                style: GoogleFonts.inter(fontSize: 17)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Text(cake["description"] ?? "",
                                style: GoogleFonts.inter(
                                    fontSize: 14,
                                    color:
                                        const Color.fromRGBO(80, 80, 80, 1))),
                          ),

                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 8),
                                child: Text("₹${cake["price"]}",
                                    style: GoogleFonts.inter(
                                      fontSize: 19,
                                      color:
                                          const Color.fromRGBO(252, 120, 70, 1),
                                    )),
                              ),
                              const Spacer(),
                              Container(
                                height: 34,
                                width: 36,
                                decoration: const BoxDecoration(
                                    color: Color.fromRGBO(252, 120, 70, 1),
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                    )),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                "Bluer than blue Cakes",
                style: GoogleFonts.inter(fontSize: 28),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: GridView.builder(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.only(top: 8),
                //scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: cakeList2.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 15,
                  childAspectRatio: 0.7,
                ),
                itemBuilder: (ctx, index) {
                  final cake = cakeList2[index];
                  return GestureDetector(
                    onTap: () => _showCakeDetails(context, cake),
                    child: Container(
                      height: 200,
                      width: 100,
                      decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromARGB(55, 0, 0, 0),
                              spreadRadius: 0,
                              blurRadius: 8,
                              offset: Offset(0, 2),
                            ),
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      clipBehavior: Clip.antiAlias,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            cake["image"] ?? "",
                            fit: BoxFit.cover,
                            height: 160,
                            width: 240,
                          ),
                          const Spacer(),
                          // SvgPicture.asset("assets/svg/cake1.svg"),
                          Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Text(cake["name"] ?? "",
                                style: GoogleFonts.inter(fontSize: 17)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Text(cake["description"] ?? "",
                                style: GoogleFonts.inter(
                                    fontSize: 14,
                                    color:
                                        const Color.fromRGBO(80, 80, 80, 1))),
                          ),

                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 8),
                                child: Text("₹${cake["price"]}",
                                    style: GoogleFonts.inter(
                                      fontSize: 19,
                                      color:
                                          const Color.fromRGBO(252, 120, 70, 1),
                                    )),
                              ),
                              const Spacer(),
                              Container(
                                height: 34,
                                width: 36,
                                decoration: const BoxDecoration(
                                    color: Color.fromRGBO(252, 120, 70, 1),
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                    )),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                "Girly Pink Cakes",
                style: GoogleFonts.inter(fontSize: 28),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: GridView.builder(
                padding: const EdgeInsets.only(top: 8),
                //scrollDirection: Axis.vertical,
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: cakeList3.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 15,
                  childAspectRatio: 0.7,
                ),
                itemBuilder: (ctx, index) {
                  final cake = cakeList3[index];
                  return GestureDetector(
                    onTap: () => _showCakeDetails(context, cake),
                    child: Container(
                      height: 200,
                      width: 100,
                      decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromARGB(55, 0, 0, 0),
                              spreadRadius: 0,
                              blurRadius: 8,
                              offset: Offset(0, 2),
                            ),
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      clipBehavior: Clip.antiAlias,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            cake["image"] ?? "",
                            fit: BoxFit.cover,
                            height: 160,
                            width: 240,
                          ),
                          const Spacer(),
                          // SvgPicture.asset("assets/svg/cake1.svg"),
                          Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Text(cake["name"] ?? "",
                                style: GoogleFonts.inter(fontSize: 17)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Text(cake["description"] ?? "",
                                style: GoogleFonts.inter(
                                    fontSize: 14,
                                    color:
                                        const Color.fromRGBO(80, 80, 80, 1))),
                          ),

                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 8),
                                child: Text("₹${cake["price"]}",
                                    style: GoogleFonts.inter(
                                      fontSize: 19,
                                      color:
                                          const Color.fromRGBO(252, 120, 70, 1),
                                    )),
                              ),
                              const Spacer(),
                              Container(
                                height: 34,
                                width: 36,
                                decoration: const BoxDecoration(
                                    color: Color.fromRGBO(252, 120, 70, 1),
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                    )),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                "Barbie Cakes",
                style: GoogleFonts.inter(fontSize: 28),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: GridView.builder(
                physics: const BouncingScrollPhysics(),
                //scrollDirection: Axis.vertical,
                padding: const EdgeInsets.only(top: 8),
                shrinkWrap: true,
                itemCount: cakeList4.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 15,
                  childAspectRatio: 0.7,
                ),
                itemBuilder: (ctx, index) {
                  final cake = cakeList4[index];
                  return GestureDetector(
                    onTap: () => _showCakeDetails(context, cake),
                    child: Container(
                      height: 200,
                      width: 100,
                      decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromARGB(55, 0, 0, 0),
                              spreadRadius: 0,
                              blurRadius: 8,
                              offset: Offset(0, 2),
                            ),
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      clipBehavior: Clip.antiAlias,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            cake["image"] ?? "",
                            fit: BoxFit.cover,
                            height: 160,
                            width: 240,
                          ),
                          const Spacer(),
                          // SvgPicture.asset("assets/svg/cake1.svg"),
                          Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Text(cake["name"] ?? "",
                                style: GoogleFonts.inter(fontSize: 17)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Text(cake["description"] ?? "",
                                style: GoogleFonts.inter(
                                    fontSize: 14,
                                    color:
                                        const Color.fromRGBO(80, 80, 80, 1))),
                          ),

                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 8),
                                child: Text("₹${cake["price"]}",
                                    style: GoogleFonts.inter(
                                      fontSize: 19,
                                      color:
                                          const Color.fromRGBO(252, 120, 70, 1),
                                    )),
                              ),
                              const Spacer(),
                              Container(
                                height: 34,
                                width: 36,
                                decoration: const BoxDecoration(
                                    color: Color.fromRGBO(252, 120, 70, 1),
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                    )),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                "Heart Cakes",
                style: GoogleFonts.inter(fontSize: 28),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: GridView.builder(
                padding: const EdgeInsets.only(top: 8),
                physics: const BouncingScrollPhysics(),
                //scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: cakeList5.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 15,
                  childAspectRatio: 0.7,
                ),
                itemBuilder: (ctx, index) {
                  final cake = cakeList5[index];
                  return GestureDetector(
                    onTap: () => _showCakeDetails(context, cake),
                    child: Container(
                      height: 200,
                      width: 100,
                      decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromARGB(55, 0, 0, 0),
                              spreadRadius: 0,
                              blurRadius: 8,
                              offset: Offset(0, 2),
                            ),
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      clipBehavior: Clip.antiAlias,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            cake["image"] ?? "",
                            fit: BoxFit.cover,
                            height: 160,
                            width: 240,
                          ),
                          const Spacer(),
                          // SvgPicture.asset("assets/svg/cake1.svg"),
                          Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Text(cake["name"] ?? "",
                                style: GoogleFonts.inter(fontSize: 17)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Text(cake["description"] ?? "",
                                style: GoogleFonts.inter(
                                    fontSize: 14,
                                    color:
                                        const Color.fromRGBO(80, 80, 80, 1))),
                          ),

                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 8),
                                child: Text("₹${cake["price"]}",
                                    style: GoogleFonts.inter(
                                      fontSize: 19,
                                      color:
                                          const Color.fromRGBO(252, 120, 70, 1),
                                    )),
                              ),
                              const Spacer(),
                              Container(
                                height: 34,
                                width: 36,
                                decoration: const BoxDecoration(
                                    color: Color.fromRGBO(252, 120, 70, 1),
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                    )),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
