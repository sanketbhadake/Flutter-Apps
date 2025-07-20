import 'dart:convert';
import 'dart:developer';

import 'package:api_binding/getdata.dart';
import 'package:api_binding/postdata.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

List<dynamic> jsonData = [];

List allData = [];

class Homepage extends StatefulWidget {
  const Homepage({
    super.key,
  });

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Api Binding"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: getdata,
                child: Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        offset: Offset(
                          0.0,
                          2.0,
                        ),
                        blurRadius: 1.0,
                        spreadRadius: 0,
                      ),
                    ],
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                    child: Text("Get Data"),
                  ),
                ),
              ),
              GestureDetector(
                onTap: postdata,
                child: Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        offset: Offset(
                          0.0,
                          2.0,
                        ),
                        blurRadius: 1.0,
                        spreadRadius: 0,
                      ),
                    ],
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                    child: Text("Post Data"),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        offset: Offset(
                          0.0,
                          2.0,
                        ),
                        blurRadius: 1.0,
                        spreadRadius: 0,
                      ),
                    ],
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                    child: Text("Update Data"),
                  ),
                ),
              ),
              GestureDetector(
                child: Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        offset: Offset(
                          0.0,
                          2.0,
                        ),
                        blurRadius: 1.0,
                        spreadRadius: 0,
                      ),
                    ],
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                    child: Text("Delete Data"),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  void getdata() async {
    Uri Url = Uri.parse("https://api.restful-api.dev/objects");
    http.Response response = await http.get(Url);
    allData = json.decode(response.body);
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Getdata(
                  allData: jsonData,
                )));
    log("$jsonData");
  }

  void postdata() async {
    Uri Url = Uri.parse("https://api.restful-api.dev/objects");
    http.Response response = await http.get(Url);
    allData = json.decode(response.body);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const Postdata()));
    log("$allData");
  }
}
