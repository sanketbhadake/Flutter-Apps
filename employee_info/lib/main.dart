import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:playerinfo_app/playermodel.dart';
 

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyWidget());
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: 'firebase App', home: firebase());
  }
}

class firebase extends StatefulWidget {
  const firebase({super.key});

  @override
  State<firebase> createState() => _firebasetState();
}

class _firebasetState extends State<firebase> {
  TextEditingController PlayerNameController = TextEditingController();
  TextEditingController jersiNoController = TextEditingController();
  List<playerModel> playerList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Firebase Demo"),
        backgroundColor: Colors.deepOrange,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextField(
              controller: PlayerNameController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  hintText: "PlayerName"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextField(
              controller: jersiNoController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  hintText: "jersiNo"),
            ),
          ),
          GestureDetector(
            onTap: () {
              if (PlayerNameController.text.trim().isNotEmpty &&
                  jersiNoController.text.trim().isNotEmpty) {
                Map<String, dynamic> data = {
                  "playerName": PlayerNameController.text.trim(),
                  "jersiNo": jersiNoController.text.trim(),
                };
                FirebaseFirestore.instance.collection("demoProoject").add(data);
                PlayerNameController.clear();
                jersiNoController.clear();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Center(child: Text("Data is Added")),
                  ),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Center(child: Text("Invalid Data")),
                  ),
                );
              }
            },
            child: Container(
              margin: const EdgeInsets.all(20),
              height: 60,
              width: 300,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Center(
                child: Text(
                  "ADD DATA",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () async {
              QuerySnapshot response = await FirebaseFirestore.instance
                  .collection("demoProoject")
                  .get();
              playerList.clear();

              for (int i = 0; i < response.docs.length; i++) {
                playerList.add(
                  playerModel(
                    name: response.docs[i]['playerName'],
                    jersiNo: response.docs[i]['jersiNo'],
                  ),
                );
              }
              setState(() {});
            },
            child: Container(
              height: 60,
              width: 300,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Center(
                child: Text(
                  "GET DATA",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: playerList.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: GestureDetector(
                      onTap: () {
                        playerList.remove(index);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Data Deleted"),
                          ),
                        );
                        setState(() {});
                      },
                      child: Container(
                        height: 60,
                        width: 200,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 241, 234, 234),
                            borderRadius: BorderRadius.circular(15)),
                        child: Column(
                          children: [
                            Text(
                              "Player Name : ${playerList[index].name}",
                              style: const TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              "Jersi No :${playerList[index].jersiNo}",
                              style: const TextStyle(
                                fontSize: 20,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },),
          ),
        ],
      ),
    );
  }
}
