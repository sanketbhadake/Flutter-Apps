import 'package:flutter/material.dart';
void main(){

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
          title: Text("Sanket"),
          backgroundColor: Colors.amber,
          centerTitle: true,

        ),
      )
    );
  }

}
