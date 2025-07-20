import 'package:flutter/material.dart';

void main() {
  runApp(const myApp());
}

class myApp extends StatefulWidget {
  const myApp({super.key});
  @override
  State createState() => _myAppstate();
}

// ignore: camel_case_types
class _myAppstate extends State {
  int count = 0;

  bool changecolor = true;
  @override
  Widget build(BuildContext context) {
    List player = [
      "https://resize.indiatvnews.com/en/resize/newbucket/1080_-/2023/09/untitled-design-2023-09-13t155603-1694600852.jpg",
      "https://www.india.com/wp-content/uploads/2023/11/MixCollage-17-Nov-2023-06-27-PM-5746.jpg",
      "https://images.firstpost.com/uploads/2024/02/MS-Dhoni-CSK-IPL-2023-PTI-1200-2024-02-9c8c7d515e57c707fd33cef140b5d687.jpg?im=FitAndFill=(596,336)",
      "https://wallpapers.com/images/hd/rohit-sharma-cricket-hand-signals-gde7t1b55k2mg4tp.jpg"
    ];
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("player"),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: Center(
          child: Container(
            height: 300,
            width: 300,
            child: Image.network(player[count]),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (count < player.length - 1) {
              count++;
            } else {
              count = 0;
            }
            setState(() {});
          },
          child: const Icon(
            Icons.add,
          ),
        ),
      ),
    );
  }
}
