// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// void main() {
//   runApp(const Searchbar());
// }

// class Searchbar extends StatefulWidget {
//   const Searchbar({super.key});

//   @override
//   State<Searchbar> createState() => _SearchbarState();
// }

// class _SearchbarState extends State<Searchbar> {
//   final List<Map<String, String>> cakeList1 = [
//     {
//       "name": "Choco Fountain",
//       "price": "750",
//       "image": "assets/overloaded/1.jpg"
//     },
//     {
//       "name": "Oreo Fountain",
//       "price": "800",
//       "image": "assets/overloaded/2.jpg"
//     },
//     {
//       "name": "Milky Fountain",
//       "price": "550",
//       "image": "assets/overloaded/3.jpg"
//     },
//     {"name": "Candy Tower", "price": "600", "image": "assets/overloaded/4.jpg"},
//   ];
//   final List<Map<String, String>> cakeList2 = [
//     {"name": "Vibrant Blue", "price": "600", "image": "assets/blue/1.jpg"},
//     {"name": "Blue Chocolate", "price": "750", "image": "assets/blue/2.jpg"},
//     {"name": "Golden Jewels", "price": "800", "image": "assets/blue/3.jpg"},
//     {"name": "Vintage Blue", "price": "650", "image": "assets/blue/4.jpg"},
//   ];
//   final List<Map<String, String>> cakeList3 = [
//     {"name": "Creamy Frost ", "price": "650", "image": "assets/pink/1.jpg"},
//     {"name": "Sweet Symphony", "price": "640", "image": "assets/pink/2.jpg"},
//     {"name": "Vibrant Pink", "price": "700", "image": "assets/pink/3.jpg"},
//     {"name": "Fluffy Pink", "price": "600", "image": "assets/pink/4.jpg"},
//   ];
//   final List<Map<String, String>> cakeList4 = [
//     {"name": "Drunk Barbie", "price": "750", "image": "assets/barbie/1.jpg"},
//     {"name": "Party Frost", "price": "770", "image": "assets/barbie/2.jpg"},
//     {
//       "name": "Candies Overloaded",
//       "price": "800",
//       "image": "assets/barbie/3.jpg"
//     },
//     {"name": "Waffers & Candy", "price": "790", "image": "assets/barbie/4.jpg"},
//   ];
//   final List<Map<String, String>> cakeList5 = [
//     {"name": "Glittering Heart", "price": "550", "image": "assets/heart/1.jpg"},
//     {"name": "Glamour Cake", "price": "600", "image": "assets/heart/2.jpg"},
//     {"name": "Tender Heart", "price": "570", "image": "assets/heart/3.jpg"},
//     {
//       "name": "Enchanting Butterflies",
//       "price": "650",
//       "image": "assets/heart/4.jpg"
//     },
//     {"name": "Delecious Bloom", "price": "600", "image": "assets/heart/5.jpg"},
//     {"name": "Creamy Heart", "price": "590", "image": "assets/heart/6.jpg"},
//     {"name": "Vintage Heart", "price": "550", "image": "assets/heart/7.jpg"},
//     {
//       "name": "Dancing Butterflies",
//       "price": "610",
//       "image": "assets/heart/8.jpg"
//     },
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           SizedBox(
//             height: 50,
//           ),
//           TextField(
//             controller: SearchController(),
//             decoration: InputDecoration(
//               suffixIcon: const Icon(Icons.search),
//               border:
//                   OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
//               hintText: "Find Your Craving",
//               hintStyle: GoogleFonts.inter(fontSize: 18),
//               enabledBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(20),
//                 borderSide: const BorderSide(
//                     color: Color.fromRGBO(254, 114, 76, 1), width: 1),
//               ),
//             ),
//           ),
//           GridView.builder(
//             padding: const EdgeInsets.only(top: 8),
//             primary: false,
//             physics: const BouncingScrollPhysics(),
//             shrinkWrap: true,
//             itemCount: cakeList1.length,
//             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 2,
//               crossAxisSpacing: 10,
//               mainAxisSpacing: 15,
//               childAspectRatio: 0.7,
//             ),
//             itemBuilder: (ctx, index) {
//               final cake = cakeList1[index];
//               return GestureDetector(
//                 child: Container(
//                   height: 200,
//                   width: 100,
//                   decoration: BoxDecoration(
//                       boxShadow: const [
//                         BoxShadow(
//                           color: Color.fromARGB(55, 0, 0, 0),
//                           spreadRadius: 0,
//                           blurRadius: 8,
//                           offset: Offset(0, 2),
//                         ),
//                       ],
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(20)),
//                   clipBehavior: Clip.antiAlias,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Image.asset(
//                         cake["image"] ?? "",
//                         fit: BoxFit.cover,
//                         height: 160,
//                         width: 240,
//                       ),
//                       const Spacer(),
//                       // SvgPicture.asset("assets/svg/cake1.svg"),
//                       Padding(
//                         padding: const EdgeInsets.only(left: 8),
//                         child: Text(cake["name"] ?? "",
//                             style: GoogleFonts.inter(fontSize: 17)),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(left: 8),
//                         child: Text("With Strawberry",
//                             style: GoogleFonts.inter(
//                                 fontSize: 14,
//                                 color: const Color.fromRGBO(80, 80, 80, 1))),
//                       ),

//                       Row(
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.only(left: 8),
//                             child: Text("₹${cake["price"]}",
//                                 style: GoogleFonts.inter(
//                                   fontSize: 19,
//                                   color: const Color.fromRGBO(252, 120, 70, 1),
//                                 )),
//                           ),
//                           const Spacer(),
//                           Container(
//                             height: 34,
//                             width: 36,
//                             decoration: const BoxDecoration(
//                                 color: Color.fromRGBO(252, 120, 70, 1),
//                                 borderRadius: BorderRadius.only(
//                                   topLeft: Radius.circular(20),
//                                 )),
//                           ),
//                         ],
//                       )
//                     ],
//                   ),
//                 ),
//               );
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/cart.dart';
import 'package:project/cookies.dart';



class Searchbar extends StatefulWidget {
  const Searchbar({super.key});

  @override
  State<Searchbar> createState() => _SearchbarState();
}

class _SearchbarState extends State<Searchbar> {
  final List<Map<String, String>> cakeList1 = [
    {
      "name": "Choco Fountain",
      "price": "750",
      "image": "assets/overloaded/1.jpg"
    },
    {
      "name": "Oreo Fountain",
      "price": "800",
      "image": "assets/overloaded/2.jpg"
    },
    {
      "name": "Milky Fountain",
      "price": "550",
      "image": "assets/overloaded/3.jpg"
    },
    {"name": "Candy Tower", "price": "600", "image": "assets/overloaded/4.jpg"},
    {
      "name": "Vibrant Blue",
      "price": "600",
      "image": "assets/blue/1.jpg",
    },
    {
      "name": "Blue Chocolate",
      "price": "750",
      "image": "assets/blue/2.jpg",
    },
    {
      "name": "Golden Jewels",
      "price": "800",
      "image": "assets/blue/3.jpg",
    },
    {
      "name": "Vintage Blue",
      "price": "650",
      "image": "assets/blue/4.jpg",
    },
    {
      "name": "Creamy Frost",
      "price": "650",
      "image": "assets/pink/1.jpg",
    },
    {
      "name": "Sweet Symphony",
      "price": "640",
      "image": "assets/pink/2.jpg",
    },
    {
      "name": "Vibrant Pink",
      "price": "700",
      "image": "assets/pink/3.jpg",
    },
    {
      "name": "Fluffy Pink",
      "price": "600",
      "image": "assets/pink/4.jpg",
    },
    {
      "name": "Drunk Barbie",
      "price": "750",
      "image": "assets/barbie/1.jpg",
    },
    {
      "name": "Party Frost",
      "price": "770",
      "image": "assets/barbie/2.jpg",
    },
    {
      "name": "Candies Overloaded",
      "price": "800",
      "image": "assets/barbie/3.jpg"
    },
    {
      "name": "Waffers & Candy",
      "price": "790",
      "image": "assets/barbie/4.jpg",
    },
    {
      "name": "Glittering Heart",
      "price": "550",
      "image": "assets/heart/1.jpg",
    },
    {
      "name": "Glamour Cake",
      "price": "600",
      "image": "assets/heart/2.jpg",
    },
    {"name": "Tender Heart", "price": "570", "image": "assets/heart/3.jpg"},
    {
      "name": "Enchanting Butterflies",
      "price": "650",
      "image": "assets/heart/4.jpg"
    },
    {"name": "Delicious Bloom", "price": "600", "image": "assets/heart/5.jpg"},
    {"name": "Creamy Heart", "price": "590", "image": "assets/heart/6.jpg"},
    {"name": "Vintage Heart", "price": "550", "image": "assets/heart/7.jpg"},
    {
      "name": "Dancing Butterflies",
      "price": "610",
      "image": "assets/heart/8.jpg"
    },
  ];

  List<Map<String, String>> filteredCakes = [];

  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredCakes = cakeList1;
    // Initially display cakeList1
    searchController.addListener(_filterCakes);
  }

  void _filterCakes() {
    String query = searchController.text.toLowerCase();
    setState(
      () {
        filteredCakes = cakeList1
            .where((cake) =>
                cake["name"]!.toLowerCase().contains(query) ||
                cake["price"]!.toLowerCase().contains(query))
            .toList();
      },
    );
  }

  @override
  void dispose() {
    searchController.removeListener(_filterCakes);
    searchController.dispose();
    super.dispose();
  }

  void _showCakeDetails(BuildContext context, Map<String, String> cake) {
    String selectweight = 'Select weight';
    TextEditingController messageController = TextEditingController();
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (_) {
        return SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: StatefulBuilder(
            builder: (BuildContext context, StateSetter setModalState) =>
                Column(
              // mainAxisSize: MainAxisSize.min,
              children: [
                // const SizedBox(
                //   height: 10,
                // ),
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
                          style:
                              TextStyle(fontSize: 16, color: Colors.grey[600]),
                        ),
                        const Expanded(
                          child: SizedBox(
                            child: Text('Customize as per your requirements',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold)),
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
                          // weightOptionButton(0.5),
                          // weightOptionButton(1.0),
                          // weightOptionButton(1.5),
                          // weightOptionButton(2.0),
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

                    await addTocart(db, {
                      'name': cake['name'],
                      'description': "",
                      'price': cake['price'],
                      'imagePath': cake['image'],
                      'message': messageController.text.trim(),
                      'weight': selectweight
                    });

                    Navigator.of(context).pop();

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Basket(),
                      ),
                    );
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
                      style:
                          GoogleFonts.inter(fontSize: 18, color: Colors.white),
                    )),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: TextField(
                controller: searchController,
                decoration: InputDecoration(
                  suffixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  hintText: "Find Your Craving",
                  hintStyle: GoogleFonts.inter(fontSize: 18),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(
                        color: Color.fromRGBO(254, 114, 76, 1), width: 1),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                padding: const EdgeInsets.only(top: 8),
                primary: false,
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: filteredCakes.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 15,
                  childAspectRatio: 0.7,
                ),
                itemBuilder: (ctx, index) {
                  final cake = filteredCakes[index];
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
                          Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Text(cake["name"] ?? "",
                                style: GoogleFonts.inter(fontSize: 17)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Text(
                              "With Strawberry",
                              style: GoogleFonts.inter(
                                  fontSize: 14,
                                  color: const Color.fromRGBO(80, 80, 80, 1)),
                            ),
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
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
