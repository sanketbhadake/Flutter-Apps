import 'package:flutter/material.dart';

class Detailscreen extends StatefulWidget {
  final dynamic name;

  final dynamic image;

  final dynamic summery;

  const Detailscreen(
      {super.key,
      required this.name,
      required this.image,
      required this.summery});

  @override
  State<Detailscreen> createState() => _DetailscreenState();
}

class _DetailscreenState extends State<Detailscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Details Screen",
            style: const TextStyle(fontSize: 22, color: Colors.white),
          ),
          backgroundColor: const Color.fromARGB(255, 54, 49, 49),
        ),
        body: SingleChildScrollView(
          child: Container(
              height: 1000,
              color: Colors.black,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(children: [
                  widget.image != null
                      ? Image.network(widget.image)
                      : const Icon(
                          Icons.image,
                          size: 140,
                        ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    widget.name..replaceAll(RegExp(r'<[^>]*>'), ''),
                    style: const TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    widget.summery,
                    style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  )
                ]),
              )),
        ));
  }
}
