import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Static Listview"),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Image.network(
                "https://preview.redd.it/in-my-hard-times-mahadev-is-with-me-and-this-photo-has-v0-m2a3fgbux9bd1.jpeg?width=1080&crop=smart&auto=webp&s=6ed6e3a4a957e7e6ff8ded15b30cf9fad43fcd1b"),
            Column(
              children: [
                const Row(
                  children: [
                    Icon(
                      Icons.favorite,
                      color: Colors.red,
                    ),
                  ],
                ),
                Image.network(
                    "https://mb.cision.com/Public/14247/2902071/856b720fb81856ec_org.jpg"),
                const Row(
                  children: [
                    Icon(
                      Icons.favorite,
                      color: Colors.red,
                    ),
                  ],
                ),
                Image.network(
                    "https://mir-s3-cdn-cf.behance.net/project_modules/1400/706b9474134343.5c239806af449.jpg"),
                const Row(
                  children: [
                    Icon(
                      Icons.favorite,
                      color: Colors.red,
                    ),
                  ],
                ),
                Image.network(
                    "https://mir-s3-cdn-cf.behance.net/project_modules/1400/706b9474134343.5c239806af449.jpg"),
                const Row(
                  children: [
                    Icon(
                      Icons.favorite,
                      color: Colors.red,
                    ),
                  ],
                ),
                
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10)),
                    child: const Text(
                      "Click here",
                      style: TextStyle(fontWeight: FontWeight.w800),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
