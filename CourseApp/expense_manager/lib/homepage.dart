import 'package:expense_manager/categoery.dart';
import 'package:expense_manager/graphs.dart';
import 'package:expense_manager/trash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  void showbottomsheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) => Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Container(
            //   height: MediaQuery.of(context).viewInsets.bottom,
            //   width: 500,
            // ),
            Text(
              "Date",
              style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
            TextField(
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              "Amount",
              style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
            TextField(
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              "Category",
              style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
            TextField(
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),
            const SizedBox(
              height: 15,
            ),

            Text(
              "Description",
              style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
            TextField(
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 40,
                  width: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(70),
                    color: const Color.fromRGBO(14, 161, 125, 1),
                  ),
                  child: Center(
                      child: Text(
                    "Add",
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  )),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

   List<bool> islike = List.filled(5, true);
  String? selectedValue = "January 2024";
  final List<String> items = [
    "January 2024",
    "February 2024",
    "March 2024",
    "April 2024",
    "May 2024",
    "June 2024",
    "July 2024",
    "August 2024",
    "September 2024",
    "October 2024",
    "November 2024",
    "December 2024",
  ];
  bool selectedIndex = false;
  final List<String> menuItems = [
    "Transactions",
    "Graphs",
    "Category",
    "Trash",
    "About us"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        title: DropdownButton(
          value: selectedValue,
          onChanged: (newValue) {
            setState(() {
              selectedValue = newValue;
            });
          },
          items: items.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: GoogleFonts.poppins(fontSize: 20),
              ),
            );
          }).toList(),
          icon: Icon(Icons.keyboard_arrow_down_sharp),
        ),
      ),
      drawer: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 60,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text("Expense Manager",
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text("Saves all your Transactions",
                  style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: const Color.fromRGBO(0, 0, 0, 0.5))),
            ),
            ListView.builder(
              itemCount: menuItems.length,
              shrinkWrap: true,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(top: 25, right: 50),
                child: GestureDetector(
                  onTap: () {
                   
                    setState(() {
                       islike != islike;
                    });
                  },
                  child: Container(
                    height: 50,
                    width: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                        color: islike[index]
                            ? Colors.white 
                            : Color.fromRGBO(14, 161, 125, 0.15)),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 20,
                        ),
                        SvgPicture.asset("assets/svg/tansaction.svg"),
                        const SizedBox(
                          width: 15,
                        ),
                        Text(
                          menuItems[index],
                          style: GoogleFonts.poppins(
                              fontSize: 19,
                              fontWeight: FontWeight.w400,
                              color: const Color.fromRGBO(14, 161, 125, 1)),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            // GestureDetector(
            //   onTap: () {
            //     iscolor = false;
            //     Navigator.of(context).push(
            //       MaterialPageRoute(
            //         builder: (context) => const Graphs(),
            //       ),
            //     );
            //     setState(() {});
            //   },
            //   child: Padding(
            //     padding: const EdgeInsets.only(top: 30),
            //     child: Container(
            //       height: 45,
            //       width: 195,
            //       decoration: BoxDecoration(
            //           borderRadius: BorderRadius.only(
            //             bottomRight: Radius.circular(20),
            //             topRight: Radius.circular(20),
            //           ),
            //           color: iscolor
            //               ? Color.fromRGBO(14, 161, 125, 0.15)
            //               : Colors.white),
            //       child: Row(
            //         children: [
            //           const SizedBox(
            //             width: 15,
            //           ),
            //           SvgPicture.asset("assets/svg/tansaction.svg"),
            //           const SizedBox(
            //             width: 15,
            //           ),
            //           Text(
            //             "Graphs",
            //             style: GoogleFonts.poppins(
            //                 fontSize: 19,
            //                 fontWeight: FontWeight.w400,
            //                 color: const Color.fromRGBO(14, 161, 125, 1)),
            //           ),
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.only(top: 30),
            //   child: GestureDetector(
            //     onTap: () {
            //       iscolor = false;
            //       Navigator.of(context).push(MaterialPageRoute(
            //           builder: (context) => const Categoery()));
            //       setState(() {});
            //     },
            //     child: Container(
            //       height: 45,
            //       width: 195,
            //       decoration: BoxDecoration(
            //           borderRadius: BorderRadius.only(
            //             bottomRight: Radius.circular(20),
            //             topRight: Radius.circular(20),
            //           ),
            //           color: iscolor
            //               ? Color.fromRGBO(14, 161, 125, 0.15)
            //               : Colors.white),
            //       child: Row(
            //         children: [
            //           const SizedBox(
            //             width: 15,
            //           ),
            //           SvgPicture.asset("assets/svg/tansaction.svg"),
            //           const SizedBox(
            //             width: 15,
            //           ),
            //           Text(
            //             "Category",
            //             style: GoogleFonts.poppins(
            //                 fontSize: 19,
            //                 fontWeight: FontWeight.w400,
            //                 color: const Color.fromRGBO(14, 161, 125, 1)),
            //           ),
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
            // GestureDetector(
            //   onTap: () {
            //     iscolor = false;
            //     Navigator.of(context).push(
            //       MaterialPageRoute(
            //         builder: (context) => const Trashscreen(),
            //       ),
            //     );
            //     setState(() {});
            //   },
            //   child: Padding(
            //     padding: const EdgeInsets.only(top: 30),
            //     child: Container(
            //       height: 45,
            //       width: 195,
            //       decoration: BoxDecoration(
            //           borderRadius: BorderRadius.only(
            //             bottomRight: Radius.circular(20),
            //             topRight: Radius.circular(20),
            //           ),
            //           color: iscolor
            //               ? Color.fromRGBO(14, 161, 125, 0.15)
            //               : Colors.white),
            //       child: Row(
            //         children: [
            //           const SizedBox(
            //             width: 15,
            //           ),
            //           SvgPicture.asset("assets/svg/tansaction.svg"),
            //           const SizedBox(
            //             width: 15,
            //           ),
            //           Text(
            //             "Trash",
            //             style: GoogleFonts.poppins(
            //                 fontSize: 19,
            //                 fontWeight: FontWeight.w400,
            //                 color: const Color.fromRGBO(14, 161, 125, 1)),
            //           ),
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
            // GestureDetector(
            // onTap: () {
            //   iscolor = false;
            //   setState(() {});
            // },
            // child: Padding(
            //   padding: const EdgeInsets.only(top: 30),
            //   child: Container(
            //     height: 45,
            //     width: 195,
            //     decoration: BoxDecoration(
            //         borderRadius: BorderRadius.only(
            //           bottomRight: Radius.circular(20),
            //           topRight: Radius.circular(20),
            //         ),
            //         color: iscolor
            //             ? Color.fromRGBO(14, 161, 125, 0.15)
            //             : Colors.white),
            //     child: Row(
            //       children: [
            //         const SizedBox(
            //           width: 15,
            //         ),
            //         SvgPicture.asset("assets/svg/tansaction.svg"),
            //         const SizedBox(
            //           width: 15,
            //         ),
            //         Text(
            //           "About us",
            //           style: GoogleFonts.poppins(
            //               fontSize: 19,
            //               fontWeight: FontWeight.w400,
            //               color: const Color.fromRGBO(14, 161, 125, 1)),
            //         ),
            // ],
            // ),
            // ),
            // ),
            // ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: 2,
        shrinkWrap: true,
        itemBuilder: (context, index) => Container(
          height: 80,
          width: 100,
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(width: 0.3),
            ),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(9.0),
                child: Container(
                  height: 60,
                  width: 60,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    // color: Colors.amber
                  ),
                  child: Center(
                    child: Image.asset(
                      "assets/Mask group.png",
                      scale: 0.3,
                    ),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Text(
                        "Medicine",
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      // // Spacer(),
                      const SizedBox(
                        width: 180,
                      ),
                      Image.asset("assets/Subtract.png"),
                      const SizedBox(
                        width: 5,
                      ),
                      Text("500", style: GoogleFonts.poppins(fontSize: 14)),
                    ],
                  ),
                  Text(
                    "Lorem Ipsum is simply dummy text of the ",
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 217,
                      ),
                      Text(
                        "3 June | 11:50 AM",
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          color: const Color.fromRGBO(0, 0, 0, 0.6),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: showbottomsheet,
        label: Text(
          'Add Transaction',
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
        ),
        icon: const Icon(
          Icons.add,
          color: Color.fromRGBO(14, 161, 125, 1),
          size: 35,
          weight: 900,
          shadows: [
            Shadow(
              color: Colors.black,
              offset: Offset(0, 2),
              blurRadius: 5,
            )
          ],
        ),
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
