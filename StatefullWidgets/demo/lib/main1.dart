import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    MediaQuery.of(context).size.height;
    MediaQuery.of(context).size.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
            title: const Text(
              "Shoes",
              style: TextStyle(
                color: Color.fromARGB(255, 65, 98, 227),
              ),
            ),
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.shopping_cart,
                    color: Color.fromARGB(255, 65, 98, 227),
                  ))
            ]),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(1),
                margin: const EdgeInsets.only(bottom: 5),
                height: 450,
                width: 500,
                child: Image.network(
                    "https://app.vectary.com/website_assets/636cc9840038712edca597df/636cc9840038713d9aa59ac2_UV_hero.jpg",
                    fit: BoxFit.cover),
              ),
              const Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    "Nike Air Force 1'' 07",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 15, top: 5),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 65, 98, 227),
                        borderRadius: BorderRadius.circular(25)),
                    child: const Text(
                      "SHOES",
                      style: TextStyle(
                          fontWeight: FontWeight.w600, color: Colors.white),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 5),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 65, 98, 227),
                        borderRadius: BorderRadius.circular(25)),
                    child: const Text(
                      "FOOTWEAR",
                      style: TextStyle(
                          fontWeight: FontWeight.w600, color: Colors.white),
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.all(15),
                child: const Text(
                  "With Iconic style and legendary comfort ,the AF-1 was made to be worn on repeat.This iteration put a fresh spin on the hoopsclassic with crisp leather ,era-echoing '80s constrution and reflective-design Swoosh logos.",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
              ),
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 15, right: 10),
                    child: const Text(
                      "Quality",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
                    ),
                  ),
                  const Icon(Icons.remove),
                  const SizedBox(
                    width: 8,
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    height: 30,
                    width: 30,
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.black)),
                    child: Text(
                      "$count",
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontWeight: FontWeight.w900),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Icon(Icons.add),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  margin: const EdgeInsets.only(left: 15, right: 15),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                  width: 500,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 65, 98, 227),
                      borderRadius: BorderRadius.circular(35)),
                  child: const Text(
                    "PURCHASE",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
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
