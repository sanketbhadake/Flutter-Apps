import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  //final CarouselController _carouselController = CarouselController();

  int _currentIndex = 0;

  final List<Map<String, String>> items = [
    {"title": "Rapier", "image": "assets/png/acai 1.png"},
    {"title": "Choco", "image": "assets/png/acai 1.png"},
    {"title": "Strawberry", "image": "assets/png/acai 1.png"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: Color(0xFF9B27E0),
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: "Menu"),
          BottomNavigationBarItem(
            icon: Icon(Icons.trending_up),
            label: "Rapier",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Profile Row (unchanged)
              Row(
                children: [
                  Image.asset("assets/png/foto_Perfil.png"),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Fulano",
                        style: GoogleFonts.sourceSans3(
                          fontWeight: FontWeight.w700,
                          fontSize: 24,
                        ),
                      ),
                      Text(
                        "Administrator",
                        style: GoogleFonts.sourceSans3(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: Color.fromRGBO(140, 140, 140, 1),
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  SvgPicture.asset("assets/svg/bell.svg"),
                ],
              ),
              SizedBox(height: 20),

              // Search Field
              Row(
                children: [
                  Container(
                    height: 50,
                    width: 270,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: Colors.white,
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: SvgPicture.asset(
                          "assets/svg/search.svg",
                          fit: BoxFit.scaleDown,
                        ),
                        hintText: "Look for...",
                        hintStyle: GoogleFonts.sourceSans3(
                          color: Color.fromRGBO(174, 174, 174, 1),
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Spacer(),
                  Container(
                    height: 48,
                    width: 48,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: Color.fromRGBO(138, 25, 214, 1),
                    ),
                    child: Icon(Icons.tune, color: Colors.white),
                  ),
                ],
              ),
              SizedBox(height: 20),

              // Carousel Slider
              CarouselSlider.builder(
                itemCount: items.length,
                itemBuilder: (context, index, realIndex) {
                  final item = items[index];
                  return Container(
                    height: 170,
                    width: 380,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Color.fromRGBO(182, 109, 255, 1),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 30,
                      ),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Manage",
                                style: GoogleFonts.sourceSans3(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                item["title"]!,
                                style: GoogleFonts.sourceSans3(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 27,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 10),
                              Container(
                                height: 45,
                                width: 135,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(14),
                                  color: Color.fromRGBO(138, 25, 214, 1),
                                ),
                                child: Center(
                                  child: Text(
                                    "Access",
                                    style: GoogleFonts.sourceSans3(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          SizedBox(
                            height: 130,
                            width: 130,
                            child: Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Positioned(
                                  top: 1,
                                  child: Container(
                                    height: 125,
                                    width: 125,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color.fromRGBO(129, 48, 172, 1),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: -45,
                                  right: -35,
                                  child: Image.asset(
                                    item["image"]!,
                                    height: 180,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                options: CarouselOptions(
                  height: 200,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  aspectRatio: 2.0,
                  enableInfiniteScroll: true,
                  viewportFraction: 0.95,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                ),
              ),
              SizedBox(height: 10),

              // Smooth Page Indicator
              Center(
                child: AnimatedSmoothIndicator(
                  activeIndex: _currentIndex,
                  count: items.length,
                  effect: ExpandingDotsEffect(
                    activeDotColor: Colors.purple,
                    dotColor: Colors.grey,
                    dotHeight: 10,
                    dotWidth: 10,
                  ),
                ),
              ),
              Text(
                "Statistics",
                style: GoogleFonts.sourceSans3(
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 110,
                    width: 110,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: Color.fromRGBO(138, 25, 214, 1),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset("assets/svg/bar-chart-02.svg"),
                        Text(
                          "920",
                          style: GoogleFonts.sourceSans3(
                            fontWeight: FontWeight.w600,
                            fontSize: 21,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "Products",
                          style: GoogleFonts.sourceSans3(
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 110,
                    width: 110,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: Color.fromRGBO(138, 25, 214, 1),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset("assets/svg/graph-01.svg"),
                        Text(
                          "52",
                          style: GoogleFonts.sourceSans3(
                            fontWeight: FontWeight.w600,
                            fontSize: 21,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "Sold",
                          style: GoogleFonts.sourceSans3(
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 110,
                    width: 110,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: Color.fromRGBO(138, 25, 214, 1),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset("assets/svg/bar-chart-01.svg"),
                        Text(
                          "9000",
                          style: GoogleFonts.sourceSans3(
                            fontWeight: FontWeight.w600,
                            fontSize: 21,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "Profit",
                          style: GoogleFonts.sourceSans3(
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 25),
              Row(
                children: [
                  Text(
                    "Recent Messages",
                    style: GoogleFonts.sourceSans3(
                      fontWeight: FontWeight.w700,
                      fontSize: 22,
                    ),
                  ),
                  Spacer(),
                  Text(
                    "See More",
                    style: GoogleFonts.sourceSans3(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(width: 5),
                  SvgPicture.asset("assets/svg/Icon (1).svg"),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height,
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  itemCount: 6,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Container(
                      height: 80,
                      width: 340,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Color.fromRGBO(255, 255, 255, 1),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset("assets/png/foto_Perfil.png"),
                            SizedBox(width: 10),

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Cyclane",
                                  style: GoogleFonts.sourceSans3(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15,
                                  ),
                                ),
                                Text(
                                  "Subject...",
                                  style: GoogleFonts.sourceSans3(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    color: Color.fromRGBO(140, 140, 140, 1),
                                  ),
                                ),
                              ],
                            ),
                            Spacer(),
                            Text(
                              "1h",
                              style: GoogleFonts.sourceSans3(
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                              ),
                            ),
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
    );
  }
}
