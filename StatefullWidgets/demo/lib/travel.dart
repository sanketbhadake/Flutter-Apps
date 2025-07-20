import 'package:flutter/material.dart';

void main() {
  runApp(const MyWidget());
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Where do you want travel?",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: const Color.fromRGBO(27, 48, 101, 1),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(20),
                    height: 50,
                    width: 400,
                    child: Row(
                      children: [
                        Container(
                          height: 50,
                          width: 300,
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(233, 237, 248, 1),
                              borderRadius: BorderRadius.circular(30)),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Select Destination",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: Color.fromRGBO(52, 111, 249, 1)),
                                ),
                                Icon(Icons.arrow_downward_outlined)
                              ],
                            ),
                          ),
                        ),
                        Spacer(),
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(52, 111, 249, 1),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            Container(
              margin: EdgeInsets.only(
                left: 20,
              ),
              child: Text(
                "Best Deals",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                left: 20,
              ),
              child: Text(
                "Sorted by lower price",
                style: TextStyle(
                    color: Color.fromRGBO(179, 182, 187, 1),
                    fontWeight: FontWeight.w500,
                    fontSize: 15),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.all(20),
                    height: 180,
                    width: 180,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color.fromRGBO(233, 237, 248, 1)),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      right: 20,
                      top: 20,
                      bottom: 20,
                    ),
                    height: 180,
                    width: 180,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color.fromRGBO(233, 237, 248, 1)),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      right: 20,
                      top: 20,
                      bottom: 20,
                    ),
                    height: 180,
                    width: 180,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color.fromRGBO(233, 237, 248, 1)),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                left: 20,
              ),
              child: Text(
                "Popular Destinations",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                left: 20,
              ),
              child: Text(
                "Sorted by Higher reting",
                style: TextStyle(
                    color: Color.fromRGBO(179, 182, 187, 1),
                    fontWeight: FontWeight.w500,
                    fontSize: 15),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.all(20),
                    height: 200,
                    width: 180,
                    child: Column(
                      children: [
                        Container(
                          height: 180,
                          width: 180,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Color.fromRGBO(233, 237, 248, 1)),
                        ),
                        Container(
                          child: Text("Cancun "),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      right: 20,
                      top: 20,
                      bottom: 20,
                    ),
                    height: 200,
                    width: 180,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color.fromRGBO(233, 237, 248, 1)),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      right: 20,
                      top: 20,
                      bottom: 20,
                    ),
                    height: 200,
                    width: 180,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color.fromRGBO(233, 237, 248, 1)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
