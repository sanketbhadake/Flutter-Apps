import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CertificatePage extends StatefulWidget {
  const CertificatePage({super.key});

  @override
  State<CertificatePage> createState() => _CertificatePageState();
}

class _CertificatePageState extends State<CertificatePage> {
  List images = [
    "assets/Quizeethon.png",
    "assets/super x.jpg",
    "assets/tcs ion.jpg",
    "assets/certificate.jpg",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(Icons.arrow_back_ios_new, color: Colors.white),
        ),
        backgroundColor: Color.fromRGBO(83, 177, 117, 1),
        title: Text(
          "Certificates",
          style: GoogleFonts.poppins(
            fontSize: 25,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 40),
          child: Column(
            children: [
              ListView.builder(
                itemCount: images.length,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Image.asset("${images[index]}"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
