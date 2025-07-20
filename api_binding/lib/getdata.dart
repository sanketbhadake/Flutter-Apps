import 'dart:developer';

import 'package:api_binding/detailscreen.dart';
import 'package:api_binding/homepage.dart';
import 'package:flutter/material.dart';

List images = [
  'https://m.media-amazon.com/images/I/71YJ2QMIM6L.jpg',
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRtGLi5iO3EvT56J1eDxC2x6KFokez3SB-xrQ&s",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTMNYVrVWR2wEwAcsnGzddPv8ppeaXC9pg6-Q&s",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRFeJpIo2VnfsO--jmrH9HyHfAt0VdVv4QdCw&s",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRQepE-Hd7jIwzi12KYaTEsijyjm47wRnWm_w&s",
  "https://m.media-amazon.com/images/I/71CAKit3DcL._AC_UF1000,1000_QL80_.jpg",
  "https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/airpods-pro-compare-202409_FMT_WHH?wid=286&hei=324&fmt=jpeg&qlt=90&.v=1723594294397",
  "https://m.media-amazon.com/images/I/71CAKit3DcL._AC_UF1000,1000_QL80_.jpg",
  "https://m.media-amazon.com/images/I/71CAKit3DcL._AC_UF1000,1000_QL80_.jpg",
  "https://m.media-amazon.com/images/I/71CAKit3DcL._AC_UF1000,1000_QL80_.jpg",
  "https://m.media-amazon.com/images/I/71CAKit3DcL._AC_UF1000,1000_QL80_.jpg",
  "https://m.media-amazon.com/images/I/71CAKit3DcL._AC_UF1000,1000_QL80_.jpg"
];

class Getdata extends StatefulWidget {
  const Getdata({super.key, allData});

  @override
  State<Getdata> createState() => _GetdataState();
}

class _GetdataState extends State<Getdata> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Display Data Screen"),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: ListView.builder(
          shrinkWrap: true,
          itemCount: allData.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Detailscreen(
                      images: images[index],
                      name: allData[index]['name'] ,
                      color: allData[index]["data"]['color'],
                      capacity: allData[index]["data"]['capacity'],
                      price: allData[index]["data"]['price'],
                    ),
                  ),
                );
                log("${allData[index]["data"]}");
              },
              child: Column(
                children: [
                  SizedBox(
                      height: 200,
                      width: 500,
                      child: Image.network(images[index])),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      allData[index]['name'],
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
