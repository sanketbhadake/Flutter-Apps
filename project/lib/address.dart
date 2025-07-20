import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';


class AddressDetailsScreen extends StatefulWidget {
  const AddressDetailsScreen({super.key});

  @override
  _AddressDetailsScreenState createState() => _AddressDetailsScreenState();
}

class _AddressDetailsScreenState extends State<AddressDetailsScreen> {
  final _formKey = GlobalKey<FormState>();
  String addressLabel = 'Home';

  TextEditingController houseNoController = TextEditingController();
  TextEditingController buildingNoController = TextEditingController();
  TextEditingController landmarkController = TextEditingController();
  TextEditingController typeController = TextEditingController();
  TextEditingController recNameController = TextEditingController();
  TextEditingController phoneNoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Address Details'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: houseNoController,
                decoration: const InputDecoration(
                  labelText: "House No. & Floor *",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter house number and floor';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              // Building & Block No.
              TextFormField(
                controller: buildingNoController,
                decoration: const InputDecoration(
                  labelText: "Building & Block No. (Optional)",
                ),
              ),
              const SizedBox(height: 16),
              // Landmark & Area Name
              TextFormField(
                controller: landmarkController,
                decoration: const InputDecoration(
                  labelText: "Landmark & Area Name (Optional)",
                ),
              ),
              const SizedBox(height: 24),
              // Address Label
              const Text("Add Address Label"),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ChoiceChip(
                    label: const Text("Home"),
                    selected: addressLabel == 'Home',
                    onSelected: (selected) {
                      setState(() {
                        addressLabel = 'Home';
                      });
                    },
                  ),
                  ChoiceChip(
                    label: const Text("Work"),
                    selected: addressLabel == 'Work',
                    onSelected: (selected) {
                      setState(() {
                        addressLabel = 'Work';
                      });
                    },
                  ),
                  ChoiceChip(
                    label: const Text("Other"),
                    selected: addressLabel == 'Other',
                    onSelected: (selected) {
                      setState(() {
                        addressLabel = 'Other';
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 24),
              // Receiver Details
              TextFormField(
                controller: recNameController,
                decoration: const InputDecoration(
                  labelText: "Receiver's Name",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter receiver\'s name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: phoneNoController,
                decoration: const InputDecoration(
                  labelText: "Receiver's Phone Number",
                  prefixText: '+91 ',
                ),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter receiver\'s phone number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              // Save Address Button
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    // Save address functionality here
                    await FirebaseFirestore.instance
                        .collection("Address")
                        .doc(FirebaseAuth.instance.currentUser!.email)
                        .set({
                      'houseNo': houseNoController.text.trim(),
                      'buildingNo': buildingNoController.text.trim(),
                      'landmark': landmarkController.text.trim(),
                      'type': addressLabel,
                      'receiversName': recNameController.text.trim(),
                      'phoneNo': phoneNoController.text.trim(),
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text('Address Saved Successfully')),
                    );
                  }
                },
                child: const Text("SAVE ADDRESS"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
