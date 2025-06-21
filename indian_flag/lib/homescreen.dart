 
import 'package:flutter/material.dart';
 

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Indian Flag"),
        centerTitle: true,
        backgroundColor: Colors.amber,

      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              
              children: [
                SizedBox(
                  width: 180,
                ),
                 Container(
                  height: 500,
                  width: 10,
                  color: const Color.fromARGB(255, 47, 39, 39),),
                Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                               
                  children: [
                    Container(
                      height: 45,
                      width: 200,
                      color: Colors.orange,
                    ),
                     Container(
                    height: 45,
                    width: 200,
                    color: Colors.white,
                    child: Image.network("https://upload.wikimedia.org/wikipedia/commons/thumb/1/17/Ashoka_Chakra.svg/2048px-Ashoka_Chakra.svg.png"),
                  ),
                   Container(
                    height: 45,
                    width: 200,
                    color: Colors.green,
                  ),
                  ],
                ),
                
              ],
            ),
             Container(
              height: 30,
              width: 200,
              color: Colors.amber
              ,
            ),
             Container(
              height: 30,
              width: 280,
              color: Colors.amber,
            ),
             Container(
              height: 30,
              width: 320,
              color: Colors.amber,
            )
           
          ],
        ),
      ),
    );
  }
}