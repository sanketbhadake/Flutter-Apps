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
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Demo",
      home: MyHomepage(),
    );
  }
}

class MyHomepage extends StatefulWidget {
  const MyHomepage({super.key});

  @override
  State<MyHomepage> createState() => _MyHomepageState();
}

class _MyHomepageState extends State<MyHomepage> {
  void openbottomsheet() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Column(
            children: [
              const Text(
                "Bottom sheet demo",
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 25),
              ),
              Container(
                height: 200,
                color: Colors.amber,
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Bottomsheet"),
        ),
        body: const Center(
          child: Text("BottomSheet Demo"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
