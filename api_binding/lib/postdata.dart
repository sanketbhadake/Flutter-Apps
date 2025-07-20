import 'package:flutter/material.dart';

class Postdata extends StatefulWidget {
  const Postdata({super.key});

  @override
  State<Postdata> createState() => _PostdataState();
}

class _PostdataState extends State<Postdata> {
  TextEditingController productnamecontroller = TextEditingController();
    TextEditingController productprice = TextEditingController();
  TextEditingController productcolor = TextEditingController();

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Post Data"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            TextField(
              controller: productnamecontroller,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: "Enter Product Name"),
            ),
            const SizedBox(
              height: 20,
            ),
              TextField(
                controller: productnamecontroller,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter Product Price"),
            ),
            const SizedBox(
              height: 20,
            ),
              TextField(
                controller: productcolor,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter Product color"),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 50,
              width: 100,
              decoration: BoxDecoration(boxShadow: const [
                BoxShadow(
                  offset: Offset(
                    0.0,
                    2.0,
                  ),
                  blurRadius: 1.0,
                  spreadRadius: 0,
                ),
              ], color: Colors.amber, borderRadius: BorderRadius.circular(10)),
              child: const Center(child: Text("Submit")),
            )
          ],
        ),
      ),
    );
  }
}
