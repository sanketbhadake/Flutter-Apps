import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:project/profile.dart';

class Profile1Page extends StatefulWidget {
  final String name;

  const Profile1Page({
    super.key,
    required this.name,
  });

  @override
  // ignore: library_private_types_in_public_api
  _Profile1PageState createState() => _Profile1PageState();
}

class _Profile1PageState extends State<Profile1Page> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _fullnamecontroller = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  //  String Name = " ";
  // String MobileNo = " ";
  // void initState() {
  //   super.initState();
  //   Future.delayed(Duration.zero, () async {
  //     await ();
  //   });
  // }

  void _deleteAccount() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Delete Account"),
          content: const Text(
              "Deleting your account will remove all your orders, wallet amount, and any active referral. Are you sure?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return ProfilePage();
                    },
                  ),
                );
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Account deleted successfully')),
                );
              },
              child: const Text("Delete", style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text(
          "Profile",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        shape: const Border(
            bottom: BorderSide(
          color: Color.fromARGB(255, 230, 228, 228),
          width: 3,
        )),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Name*",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                ),
                TextFormField(
                  controller: _fullnamecontroller,
                  decoration: InputDecoration(
                    hintText: "Enter your name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your name";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20.0),
                const Text(
                  "Mobile Number*",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                TextFormField(
                  controller: _mobileController,
                  decoration: InputDecoration(
                    fillColor: const Color.fromARGB(255, 240, 205, 152),
                    hintText: "Mobile Number",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your mobile number";
                    }
                    if (value.length != 10) {
                      return "Mobile number must be 10 digits";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20.0),
                const Text(
                  "Date Of Birth*",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                TextFormField(
                  // enabled: false,
                  readOnly: true,
                  controller: _dateController,
                  decoration: InputDecoration(
                    suffixIcon: const Icon(Icons.date_range_rounded),
                    hintText: "Enter your D.O.B.",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  //keyboardType: null,
                  //keyboardAppearance: null,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your Date Of Birth";
                    }
                    return null;
                  },
                  onTap: () async {
                    DateTime? pickeddate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2025));
                    String formatedDate =
                        DateFormat.yMMMd().format(pickeddate!);

                    setState(() {
                      _dateController.text = formatedDate;
                    });
                  },
                ),
                const SizedBox(height: 30.0),
                Center(
                  child: SizedBox(
                    height: 50,
                    width: 380,
                    child: ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          // Perform submit actions here

                          await FirebaseFirestore.instance
                              .collection("ProfilePage")
                              .doc(FirebaseAuth.instance.currentUser!.email)
                              .update({
                            'Name': _fullnamecontroller.text.trim(),
                            'MobileNo': _mobileController.text.trim(),
                            'DOB': _dateController.text.trim(),
                          });
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content:
                                    Text('Profile submitted successfully')),
                          );
                        }
                        // else {
                        //   await FirebaseFirestore.instance
                        //       .collection("ProfilePage")3
                        //       .doc(Sessiondata.emailId)
                        //       .update({
                        //     'Name': _nameController.text.trim(),
                        //     'MobileNo': _mobileController.text.trim(),
                        //     'D.O.B.': _dateController.text.trim(),
                        //   });
                        // }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(255, 71, 0, 0.9),
                      ),
                      child: const Text(
                        "Submit",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30.0),
                const Divider(
                  thickness: 2,
                ),
                TextButton(
                  onPressed: _deleteAccount,
                  child: const Text(
                    "Delete Account",
                    style: TextStyle(color: Colors.red, fontSize: 20),
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  "Deleting your account will remove all your orders, wallet amount and any active referral",
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 8.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
