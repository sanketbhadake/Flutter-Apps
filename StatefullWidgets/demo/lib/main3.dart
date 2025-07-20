import 'package:flutter/material.dart';

void main() {
  runApp(const MyWidget());
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    MediaQuery.of(context).size.height;
    MediaQuery.of(context).size.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.arrow_back_ios),
          title: const Text(
            "Recomended",
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(0, 91, 135, 1)),
          ),
          centerTitle: true,
          shape: const Border(bottom: BorderSide(width: 1)),
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 15, top: 10, bottom: 10),
                child: const Text('Start a new career',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 15, right: 12),
                      height: 40,
                      width: 140,
                      decoration: BoxDecoration(
                          color: const Color.fromRGBO(0, 91, 135, 1),
                          borderRadius: BorderRadius.circular(20)),
                      child: const Center(
                        child: Text(
                          "Data Science",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 12),
                      height: 40,
                      width: 170,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 203, 208, 212),
                          borderRadius: BorderRadius.circular(25)),
                      child: const Center(
                        child: Text(
                          "Machine Learning",
                          style: TextStyle(
                            fontSize: 16,
                            color: Color.fromRGBO(0, 91, 135, 1),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 12),
                      height: 40,
                      width: 140,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 203, 208, 212),
                          borderRadius: BorderRadius.circular(25)),
                      child: const Center(
                        child: Text(
                          "Apache Spark",
                          style: TextStyle(
                            fontSize: 16,
                            color: Color.fromRGBO(0, 91, 135, 1),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 234, 233, 227),
                    borderRadius: BorderRadius.circular(30)),
                height: 150,
                width: 500,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.all(12),
                              height: 120,
                              width: 120,
                              decoration: BoxDecoration(
                                  color: Colors.amber,
                                  borderRadius: BorderRadius.circular(20)),
                              clipBehavior: Clip.antiAlias,
                              child: Image.asset("assets/demo1.jpeg"),
                            ),
                          ],
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                child: Text("Data Science",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700)),
                              ),
                              const SizedBox(
                                child: Text("Harvard University",
                                    style: TextStyle(color: Colors.grey)),
                              ),
                              const Text(
                                  "Lorem ipsum dolor sit amet edget nunc dictum est penatibus nunc.",
                                  style: TextStyle(
                                    fontSize: 12,
                                  )),
                              Row(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(top: 5),
                                    height: 25,
                                    width: 80,
                                    decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            255, 203, 208, 212),
                                        borderRadius: BorderRadius.circular(3)),
                                    child: const Center(
                                      child: Text(
                                        "Data Science",
                                        style: TextStyle(
                                          fontSize: 11,
                                          color: Color.fromRGBO(0, 91, 135, 1),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 5),
                                    decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            255, 203, 208, 212),
                                        borderRadius: BorderRadius.circular(3)),
                                    height: 25,
                                    width: 110,
                                    child: const Center(
                                      child: Text(
                                        "Machine Learning",
                                        style: TextStyle(
                                          fontSize: 11,
                                          color: Color.fromRGBO(0, 91, 135, 1),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 234, 233, 227),
                    borderRadius: BorderRadius.circular(30)),
                height: 150,
                width: 500,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.all(12),
                              height: 120,
                              width: 120,
                              decoration: BoxDecoration(
                                  color: Colors.amber,
                                  borderRadius: BorderRadius.circular(20)),
                              clipBehavior: Clip.antiAlias,
                              child: Image.asset("assets/demo1.jpeg"),
                            ),
                          ],
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                child: Text("AI & ML",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700)),
                              ),
                              const SizedBox(
                                child: Text("Harvard University",
                                    style: TextStyle(color: Colors.grey)),
                              ),
                              const Text(
                                  "Lorem ipsum dolor sit amet edget nunc dictum est penatibus nunc.",
                                  style: TextStyle(
                                    fontSize: 12,
                                  )),
                              Row(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(top: 5),
                                    height: 25,
                                    width: 110,
                                    decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            255, 203, 208, 212),
                                        borderRadius: BorderRadius.circular(3)),
                                    child: const Center(
                                      child: Text(
                                        "Machine Learning",
                                        style: TextStyle(
                                          fontSize: 11,
                                          color: Color.fromRGBO(0, 91, 135, 1),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 5),
                                    decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            255, 203, 208, 212),
                                        borderRadius: BorderRadius.circular(3)),
                                    height: 25,
                                    width: 90,
                                    child: const Center(
                                      child: Text(
                                        "Decision Tree",
                                        style: TextStyle(
                                          fontSize: 11,
                                          color: Color.fromRGBO(0, 91, 135, 1),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 234, 233, 227),
                    borderRadius: BorderRadius.circular(30)),
                height: 150,
                width: 500,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.all(12),
                              height: 120,
                              width: 120,
                              decoration: BoxDecoration(
                                  color: Colors.amber,
                                  borderRadius: BorderRadius.circular(20)),
                              clipBehavior: Clip.antiAlias,
                              child: Image.asset("assets/demo1.jpeg"),
                            ),
                          ],
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                child: Text("Big Data",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700)),
                              ),
                              const SizedBox(
                                child: Text("Harvard University",
                                    style: TextStyle(color: Colors.grey)),
                              ),
                              const Text(
                                  "Lorem ipsum dolor sit amet edget nunc dictum est penatibus nunc.",
                                  style: TextStyle(
                                    fontSize: 12,
                                  )),
                              Row(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(top: 5),
                                    height: 25,
                                    width: 60,
                                    decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            255, 203, 208, 212),
                                        borderRadius: BorderRadius.circular(3)),
                                    child: const Center(
                                      child: Text(
                                        "Big Data",
                                        style: TextStyle(
                                          fontSize: 11,
                                          color: Color.fromRGBO(0, 91, 135, 1),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 5),
                                    decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            255, 203, 208, 212),
                                        borderRadius: BorderRadius.circular(3)),
                                    height: 25,
                                    width: 90,
                                    child: const Center(
                                      child: Text(
                                        "Apache Spark",
                                        style: TextStyle(
                                          fontSize: 11,
                                          color: Color.fromRGBO(0, 91, 135, 1),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 234, 233, 227),
                    borderRadius: BorderRadius.circular(30)),
                height: 150,
                width: 500,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.all(12),
                              height: 120,
                              width: 120,
                              decoration: BoxDecoration(
                                  color: Colors.amber,
                                  borderRadius: BorderRadius.circular(20)),
                              clipBehavior: Clip.antiAlias,
                              child: Image.asset("assets/demo1.jpeg"),
                            ),
                          ],
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                child: Text("Devops",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700)),
                              ),
                              const SizedBox(
                                child: Text("Harvard University",
                                    style: TextStyle(color: Colors.grey)),
                              ),
                              const Text(
                                  "Lorem ipsum dolor sit amet edget nunc dictum est penatibus nunc.",
                                  style: TextStyle(
                                    fontSize: 12,
                                  )),
                              Row(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(top: 5),
                                    height: 25,
                                    width: 60,
                                    decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            255, 203, 208, 212),
                                        borderRadius: BorderRadius.circular(3)),
                                    child: const Center(
                                      child: Text(
                                        "Docker",
                                        style: TextStyle(
                                          fontSize: 11,
                                          color: Color.fromRGBO(0, 91, 135, 1),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 5),
                                    decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            255, 203, 208, 212),
                                        borderRadius: BorderRadius.circular(3)),
                                    height: 25,
                                    width: 80,
                                    child: const Center(
                                      child: Text(
                                        "Kubernetes",
                                        style: TextStyle(
                                          fontSize: 11,
                                          color: Color.fromRGBO(0, 91, 135, 1),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
