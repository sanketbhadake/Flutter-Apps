import 'package:cloths_store_app/details.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String select = "All";
  List data = [
    "All",
    "Men",
    "Women",
    "Kids",
    "Others",
  ];

  List items = [
    {
      "image": "assets/3.png",
      "price": "240.32",
      "name": "Tagerine Shirt",
    },
    {
      "image": "assets/4.png",
      "price": "120.32",
      "name": "Leather Coart",
    },
    {
      "image": "assets/2.png",
      "price": "184.32",
      "name": "Tagerine Shirt",
    },
    {
      "image": "assets/1.png",
      "price": "250.32",
      "name": "Leather Coart",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset("assets/Menu.png"),
                  Image.asset("assets/Profile.png")
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                "Explore",
                style: GoogleFonts.imprima(
                    fontSize: 38, fontWeight: FontWeight.w500),
              ),
              Text(
                "Best trendy collection!",
                style: GoogleFonts.imprima(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Color.fromRGBO(121, 119, 128, 1)),
              ),
              SizedBox(
                height: 53,
                child: ListView.builder(
                  itemCount: data.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {});
                        select == data[index];
                      },
                      child: Container(
                        height: 38,
                        width: 80,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(32),
                            color: select == data[index]
                                ? Color.fromRGBO(255, 122, 0, 1)
                                : Colors.white),
                        child: Center(
                          child: Text(
                            "${data[index]}",
                            style: GoogleFonts.imprima(
                              fontSize: 18,
                              color: select == data[index]
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
              SizedBox(
                height: MediaQuery.of(context).size.height,
                child: GestureDetector(
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16.0,
                      mainAxisSpacing: 16.0,
                      childAspectRatio: 0.67,
                    ),
                    itemCount: items.length,
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => Details(
                                image: items[index]['image'],
                                price: items[index]['price'],
                                name: items[index]['name']),
                          ),
                        );
                      },
                      child: SizedBox(
                        height: 160,
                        width: 250,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset("${items[index]['image']}"),
                            Text(
                              "\$${items[index]['price']}",
                              style: GoogleFonts.imprima(
                                  fontSize: 20, fontWeight: FontWeight.w600),
                            ),
                            Text(
                              "${items[index]['name']}",
                              style: GoogleFonts.imprima(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromRGBO(121, 119, 128, 1)),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
