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
  TextEditingController namecontroller = TextEditingController();
  String? myname;
  List<String> playerlist = [];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Listview Player list",
            style: TextStyle(
              fontSize: 25,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: Column(
          children: [
            SizedBox(
              height: 50,
              child: TextField(
                controller: namecontroller,
                style: const TextStyle(
                  fontSize: 25,
                ),
                decoration: const InputDecoration(
                    hintText: "Type Here",
                    hintStyle: TextStyle(fontSize: 25, color: Colors.grey),
                    border: OutlineInputBorder()),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            GestureDetector(
              onTap: () {
                myname = namecontroller.text.trim();
                if (myname != "") {
                  playerlist.add(myname!);
                  namecontroller.clear();
                  setState(() {});
                }
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(15)),
                child: const Text(
                  "Add data",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: Colors.white),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            ListView.builder(
                itemCount: playerlist.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Text(
                    "Name:${playerlist[index]}",
                    style: const TextStyle(fontSize: 25),
                  );
                })
          ],
        ),
      ),
    );
  }
}
