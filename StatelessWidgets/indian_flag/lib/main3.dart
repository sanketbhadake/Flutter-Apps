import 'package:flutter/material.dart';

void main() {
  runApp(const MyWidget());
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Indian Flag",
            style: TextStyle(
                fontSize: 25, color: Colors.white, fontWeight: FontWeight.w600),
          ),
          backgroundColor: Colors.blue,
          centerTitle: true,
        ),
        body: Row(
          children: [
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 30, left: 20),
                  height: 500,
                  width: 10,
                  color: Colors.black,
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 8),
                            height: 35,
                            width: 200,
                            color: Colors.orange,
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 8),
                            height: 35,
                            width: 200,
                            color: Colors.white,
                            child: Image.network(
                                "https://cdn.pixabay.com/photo/2023/06/23/17/47/ashok-chakra-8083914_960_720.png"),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 8),
                            height: 35,
                            width: 200,
                            color: Colors.green,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 20),
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      border: Border.all(color: Colors.black)),
                  height: 40,
                  width: 130,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 20),
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      border: Border.all(color: Colors.black)),
                  height: 40,
                  width: 200,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 20),
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      border: Border.all(color: Colors.black)),
                  height: 40,
                  width: 260,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 20),
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      border: Border.all(color: Colors.black)),
                  height: 40,
                  width: 320,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
