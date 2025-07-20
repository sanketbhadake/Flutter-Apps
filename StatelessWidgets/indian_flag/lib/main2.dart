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
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
          ),
          backgroundColor: Colors.blue,
          centerTitle: true,
        ),
        body: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 175, top: 20),
                  height: 35,
                  width: 200,
                  color: Colors.orange,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 175),
                  height: 35,
                  width: 200,
                  color: Colors.white,
                  child: Image.network(
                      "https://cdn.pixabay.com/photo/2023/06/23/17/47/ashok-chakra-8083914_960_720.png"),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 175),
                  height: 35,
                  width: 200,
                  color: Colors.green,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 20),
                          height: 400,
                          width: 10,
                          color: const Color.fromARGB(255, 69, 30, 30),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 20),
                          decoration: BoxDecoration(
                              color: Colors.amber,
                              border: Border.all(color: Colors.black)),
                          height: 40,
                          width: 150,
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
