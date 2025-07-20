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
          leading: const Icon(Icons.arrow_back_ios),
          title: const Text(
            "My cart",
            style: TextStyle(fontSize: 30, color: Colors.blue),
          ),
          centerTitle: true,
          bottom: PreferredSize(
              preferredSize: Size.fromHeight(1),
              child: Container(
                height: 1,
                color: Colors.grey,
              )),
        ),
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(15),
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 227, 224, 215),
                borderRadius: BorderRadius.circular(20),
              ),
              height: 150,
              width: 600,
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          margin: const EdgeInsets.all(15),
                          height: 110,
                          width: 110,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20)),
                          clipBehavior: Clip.antiAlias,
                          child: Image.asset("assets/demo.jpeg")),
                    ],
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: const Text(
                            "Nike Shoes",
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.w800),
                          ),
                        ),
                        Container(
                          child: const Text(
                              "With iconic style and legendary comfort, on repeat."),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(right: 55, top: 5),
                              child: const Text(
                                "570.00",
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.w800),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 5, right: 2),
                              child: const Icon(Icons.remove),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 5),
                              height: 25,
                              width: 35,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                      width: 1, color: Colors.black)),
                              child: const Center(child: Text("1")),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 5, left: 2),
                              child: const Icon(Icons.add),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(15),
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 227, 224, 215),
                borderRadius: BorderRadius.circular(20),
              ),
              height: 150,
              width: 600,
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          margin: const EdgeInsets.all(15),
                          height: 110,
                          width: 110,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20)),
                          clipBehavior: Clip.antiAlias,
                          child: Image.asset("assets/demo.jpeg")),
                    ],
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: const Text(
                            "Nike Shoes",
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.w800),
                          ),
                        ),
                        Container(
                          child: const Text(
                              "With iconic style and legendary comfort, on repeat."),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(right: 70, top: 5),
                              child: const Text(
                                "77.00",
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.w800),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 5, right: 2),
                              child: const Icon(Icons.remove),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 5),
                              height: 25,
                              width: 35,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                      width: 1, color: Colors.black)),
                              child: const Center(child: Text("1")),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 5, left: 2),
                              child: const Icon(Icons.add),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 180,
            ),
            Container(
              margin: const EdgeInsets.only(left: 30, bottom: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Subtotal:",
                    style: TextStyle(fontSize: 20),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 20),
                    child: const Text(
                      "8000.00",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 30, bottom: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Delivery Fee:",
                    style: TextStyle(fontSize: 20),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 20),
                    child: const Text(
                      "5.00",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 30, bottom: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Discount:",
                    style: TextStyle(fontSize: 20),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 20),
                    child: const Text(
                      "40%",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 30, top: 15, right: 20),
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: const Color.fromARGB(237, 34, 76, 229),
                  borderRadius: BorderRadius.circular(60)),
              height: 60,
              width: 400,
              child: const Center(
                child: Text(
                  textAlign: TextAlign.center,
                  "Checkout for ₹480.00",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
