import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  void showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false, // Prevents dismiss on tap outside
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  // padding: EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: SvgPicture.asset(
                    "assets/svg/Vector.svg",
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Profile edited!",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                SizedBox(height: 8),
                Text(
                  "Profile edited successfully",
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(height: 24),
                SizedBox(
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // Close dialog
                      // Navigate or do something
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(138, 25, 214, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 14),
                    ),
                    child: Text(
                      "Continue",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(138, 25, 214, 1),

      body: SingleChildScrollView(
        child: Stack(
          children: [
            Transform.rotate(
              angle: 0.18,
              origin: Offset(-380, 80),

              child: Transform.scale(
                scale: 1.58,
                child: SizedBox(
                  child: Image.asset(
                    "assets/png/banner_login1 1.png",

                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 45),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: SvgPicture.asset(
                  "assets/svg/Icon.svg",
                  height: 42,
                  width: 42,
                ),
              ),
            ),

            Column(
              children: [
                SizedBox(height: 260),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 663,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 120,
                      left: 20,
                      right: 20,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Information",
                          style: GoogleFonts.sourceSans3(
                            fontWeight: FontWeight.w600,
                            fontSize: 22,
                          ),
                        ),
                        SizedBox(height: 20),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 50,
                              width: 160,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8),
                                ),
                                border: Border.all(
                                  color: Color.fromRGBO(158, 158, 158, 1),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextField(
                                      scrollPadding: EdgeInsets.zero,

                                      decoration: InputDecoration(
                                        hintStyle: GoogleFonts.sourceSans3(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 15,
                                        ),
                                        hintText: "Name",

                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              height: 50,
                              width: 160,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8),
                                ),
                                border: Border.all(
                                  color: Color.fromRGBO(158, 158, 158, 1),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextField(
                                      scrollPadding: EdgeInsets.zero,

                                      decoration: InputDecoration(
                                        hintStyle: GoogleFonts.sourceSans3(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 15,
                                        ),
                                        hintText: "Nickname",

                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Container(
                          height: 50,
                          width: 400,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            border: Border.all(
                              color: Color.fromRGBO(158, 158, 158, 1),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextField(
                                  scrollPadding: EdgeInsets.zero,

                                  decoration: InputDecoration(
                                    hintStyle: GoogleFonts.sourceSans3(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15,
                                    ),
                                    hintText: "Email",

                                    border: InputBorder.none,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 50,
                              width: 160,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8),
                                ),
                                border: Border.all(
                                  color: Color.fromRGBO(158, 158, 158, 1),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextField(
                                      scrollPadding: EdgeInsets.zero,

                                      decoration: InputDecoration(
                                        hintStyle: GoogleFonts.sourceSans3(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 15,
                                        ),
                                        hintText: "Birhdate",

                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              height: 50,
                              width: 160,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8),
                                ),
                                border: Border.all(
                                  color: Color.fromRGBO(158, 158, 158, 1),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextField(
                                      scrollPadding: EdgeInsets.zero,

                                      decoration: InputDecoration(
                                        hintStyle: GoogleFonts.sourceSans3(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 15,
                                        ),
                                        hintText: "Telephone",

                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 50,
                              width: 160,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8),
                                ),
                                border: Border.all(
                                  color: Color.fromRGBO(158, 158, 158, 1),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextField(
                                      scrollPadding: EdgeInsets.zero,

                                      decoration: InputDecoration(
                                        hintStyle: GoogleFonts.sourceSans3(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 15,
                                        ),
                                        hintText: "Post",

                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              height: 50,
                              width: 160,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8),
                                ),
                                border: Border.all(
                                  color: Color.fromRGBO(158, 158, 158, 1),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextField(
                                      scrollPadding: EdgeInsets.zero,

                                      decoration: InputDecoration(
                                        hintStyle: GoogleFonts.sourceSans3(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 15,
                                        ),
                                        hintText: "Salary",

                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 50,
                              width: 160,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8),
                                ),
                                border: Border.all(
                                  color: Color.fromRGBO(158, 158, 158, 1),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextField(
                                      scrollPadding: EdgeInsets.zero,

                                      decoration: InputDecoration(
                                        hintStyle: GoogleFonts.sourceSans3(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 15,
                                        ),
                                        hintText: "City",

                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              height: 50,
                              width: 160,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8),
                                ),
                                border: Border.all(
                                  color: Color.fromRGBO(158, 158, 158, 1),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextField(
                                      scrollPadding: EdgeInsets.zero,

                                      decoration: InputDecoration(
                                        hintStyle: GoogleFonts.sourceSans3(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 15,
                                        ),
                                        hintText: "State",

                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 40),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(blurRadius: 5, color: Colors.black12),
                            ],
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    "Cancel",
                                    style: GoogleFonts.sourceSans3(
                                      fontSize: 18,
                                      color: Color.fromRGBO(138, 25, 214, 1),
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {
                                    showSuccessDialog(context);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Color.fromRGBO(
                                      138,
                                      25,
                                      214,
                                      1,
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 14,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                  ),
                                  child: Text(
                                    "Save",
                                    style: GoogleFonts.sourceSans3(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              top: 190,
              right: 125,
              child: Container(
                height: 160,
                width: 160,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color.fromRGBO(138, 25, 214, 1),
                ),
                child: Image.asset(
                  "assets/png/foto_Perfil.png",
                  scale: 0.4,
                  height: 180,
                  width: 200,
                ),
              ),
            ),
            GestureDetector(
              //Image picker add
              onTap: () {},
              child: Positioned(
                right: 45,
                top: 295,
                left: 153,
                child: SvgPicture.asset(
                  "assets/svg/icone_editar_foto.svg",
                  height: 90,
                  width: 90,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
