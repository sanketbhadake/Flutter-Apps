import 'dart:io';
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/customerS.dart';
import 'package:project/favourite.dart';
import 'package:project/generalnfo.dart';
import 'package:project/login.dart';
import 'package:project/notification.dart';
import 'package:project/orderpage.dart';
import 'package:project/profilePage.dart';
import 'package:project/address.dart';
import 'package:project/sessiondata.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({
    super.key,
  });

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List<ProfileModel> profileList = [];

  final ImagePicker _imagePicker = ImagePicker();

  XFile? _selectedFile;
  bool isloding = false;

  Future<void> uploadImage({required String fileName}) async {
    setState(() {
      isloding = true;
    });
    await FirebaseStorage.instance.ref().child(fileName).putFile(
          File(_selectedFile!.path),
        );
    log("Data uploaded");
  }

  Future<String> downloadImageURL({required String fileName}) async {
    log("Download IMage");
    String url =
        await FirebaseStorage.instance.ref().child(fileName).getDownloadURL();
    return url;
  }

  Future<void> addDataToFirebase({required String url}) async {
    Map<String, dynamic> data = {
      'profilePic': url,
    };
    log("IN ADD DATA -------${Sessiondata.emailId}");
    await FirebaseFirestore.instance
        .collection("ProfilePage")
        .doc(FirebaseAuth.instance.currentUser!.email)
        .update({'imageUrl': url});

    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("Image Added")));
  }

  Future<void> getDataFromFirebase() async {
    //  profileList.clear();
    log("IN GET DATA");
    QuerySnapshot response =
        await FirebaseFirestore.instance.collection("ProfilePage").get();
    log("data geted");
    log("Response length: ${response.docs.length}");
    // for (var value in response.docs) {
    //   profileList.add(
    //     ProfileModel(
    //       profilePic: value['profilePic'],
    //     ),
    //   );
    // }
    //  ProfileModel(
    //       profilePic: value['profilePic'],
    //     ),

    // log(profileList.toString());
    setState(() {});
  }

  String Name = " ";
  String MobileNo = " ";
  String imageUrl = "";

  //  Z

  Future<void> receiverData() async {
    log("Recieve data");
    DocumentSnapshot<Map<String, dynamic>> response = await FirebaseFirestore
        .instance
        .collection('ProfilePage')
        .doc(FirebaseAuth.instance.currentUser!.email)
        .get();

    Name = response['Name'];
    MobileNo = response['MobileNo'];
    imageUrl = response['imageUrl'];

    log("IMAGE FETCH :- ${imageUrl}");
    log("MOBILE FETCH :- ${MobileNo}");
    log("NAME FETCH :- ${Name}");

    setState(() {});

    log("data recieved");
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      await receiverData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Profile",
          style: GoogleFonts.inter(fontSize: 25, color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () async {
                _selectedFile =
                    await _imagePicker.pickImage(source: ImageSource.gallery);
                if (_selectedFile != null) {
                  setState(() {
                    isloding = true;
                    _selectedFile;
                  });
                }
                String fileName = _selectedFile!.name;
                await uploadImage(fileName: fileName);
                String imageUrl = await downloadImageURL(fileName: fileName);
                await addDataToFirebase(url: imageUrl);
                await getDataFromFirebase();

                log("IMAGE URL :- ${imageUrl}");
                log("URL :- ${_selectedFile}");

                setState(() {
                  receiverData();
                  isloding = false;
                });
              },
              child: Container(
                height: 130,
                width: 130,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(60),
                  color: Colors.orangeAccent,
                ),
                child: isloding
                    ? Center(
                        child: const CircularProgressIndicator(),
                      )
                    : (imageUrl.isNotEmpty)
                        ? Image.network(
                            imageUrl,
                            fit: BoxFit.cover,
                          )
                        : const Icon(Icons.person, size: 50),
              ),
            ),
            const SizedBox(height: 15),
            Text(
              Name,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
            ),
            Text(
              MobileNo,
              style: TextStyle(fontSize: 20, color: Colors.grey),
            ),
            const SizedBox(height: 20),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(5),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Profile1Page(
                            name: '',
                          ),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      height: 50,
                      width: 380,
                      child: const Row(
                        children: [
                          SizedBox(
                            width: 5,
                          ),
                          Icon(
                            Icons.person,
                            color: Color.fromRGBO(252, 120, 70, 1),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            "Profile",
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.w500),
                          ),
                          Spacer(),
                          Icon(Icons.arrow_forward_ios_rounded),
                          SizedBox(
                            width: 5,
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const OrderPage()));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      height: 50,
                      width: 380,
                      child: const Row(
                        children: [
                          SizedBox(
                            width: 5,
                          ),
                          Icon(
                            Icons.shopping_bag,
                            color: Color.fromRGBO(252, 120, 70, 1),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            "Orders",
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.w500),
                          ),
                          Spacer(),
                          Icon(Icons.arrow_forward_ios_rounded),
                          SizedBox(
                            width: 5,
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const FavouritePage()));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      height: 50,
                      width: 380,
                      child: const Row(
                        children: [
                          SizedBox(
                            width: 5,
                          ),
                          Icon(
                            Icons.favorite,
                            color: Color.fromRGBO(252, 120, 70, 1),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            "Favourites",
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.w500),
                          ),
                          Spacer(),
                          Icon(Icons.arrow_forward_ios_rounded),
                          SizedBox(
                            width: 5,
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const AddressDetailsScreen()));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      height: 50,
                      width: 380,
                      child: const Row(
                        children: [
                          SizedBox(
                            width: 5,
                          ),
                          Icon(
                            Icons.location_on,
                            color: Color.fromRGBO(252, 120, 70, 1),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            "Addresses",
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.w500),
                          ),
                          Spacer(),
                          Icon(Icons.arrow_forward_ios_rounded),
                          SizedBox(
                            width: 5,
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CustomerSupport()));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      height: 50,
                      width: 380,
                      child: const Row(
                        children: [
                          SizedBox(
                            width: 5,
                          ),
                          Icon(
                            Icons.support_agent,
                            color: Color.fromRGBO(252, 120, 70, 1),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            "Customer support & FAQ",
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.w500),
                          ),
                          Spacer(),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                          ),
                          SizedBox(
                            width: 5,
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const GeneralInfo()));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      height: 50,
                      width: 380,
                      child: const Row(
                        children: [
                          SizedBox(
                            width: 5,
                          ),
                          Icon(
                            Icons.info,
                            color: Color.fromRGBO(252, 120, 70, 1),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            "General Info",
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.w500),
                          ),
                          Spacer(),
                          Icon(Icons.arrow_forward_ios_rounded),
                          SizedBox(
                            width: 5,
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const NotificatonPage()));
                    },
                    child: Container(
                      height: 50,
                      width: 380,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      child: const Row(
                        children: [
                          SizedBox(
                            width: 5,
                          ),
                          Icon(
                            Icons.notifications,
                            color: Color.fromRGBO(252, 120, 70, 1),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            "Notifications",
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.w500),
                          ),
                          Spacer(),
                          Icon(Icons.arrow_forward_ios_rounded),
                          SizedBox(
                            width: 5,
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                ],
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
                  (Route<dynamic> route) => false,
                );
              },
              child: const Center(
                child: Text("Log Out",
                    style: TextStyle(
                        color: Color.fromRGBO(252, 120, 70, 1),
                        fontSize: 25,
                        fontWeight: FontWeight.w500)),
              ),
            ),
            const SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}

class ProfileModel {
  String profilePic;

  ProfileModel({
    required this.profilePic,
  });
}
