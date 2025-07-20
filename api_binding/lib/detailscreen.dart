import 'homepage.dart';
import 'package:flutter/material.dart';

class Detailscreen extends StatefulWidget {
  final String images;
  final String name;
  final String color;
  final String capacity;
  final String price;

  const Detailscreen(
      {super.key,
      required this.price,
      required this.images,
      required this.capacity,
      required this.color,
      required this.name});

  @override
  State<Detailscreen> createState() => _DetailscreenState();
}

class _DetailscreenState extends State<Detailscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Display Details"),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 200,
            width: 500,
            child: Image.network(
              widget.images,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              // allData[index]['name'],
              widget.name ,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Text(
            widget.color ,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(
            widget.capacity,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(
            widget.price,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
