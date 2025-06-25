import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ice_cream/profile.dart';

class Reciper extends StatefulWidget {
  const Reciper({super.key});

  @override
  State<Reciper> createState() => _ReciperState();
}

class _ReciperState extends State<Reciper> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 42, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const Profile()),
                    );
                  },

                  child: Image.asset("assets/png/foto_Perfil.png"),
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Fulano",
                      style: GoogleFonts.sourceSans3(
                        fontWeight: FontWeight.w700,
                        fontSize: 24,
                      ),
                    ),
                    Text(
                      "Administrator",
                      style: GoogleFonts.sourceSans3(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: Color.fromRGBO(140, 140, 140, 1),
                      ),
                    ),
                  ],
                ),
                Spacer(),
                SvgPicture.asset("assets/svg/bell.svg"),
              ],
            ),
            SizedBox(height: 250),
            Center(child: SvgPicture.asset("assets/svg/eva_wifi-off-fill.svg")),
            Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  textAlign: TextAlign.center,
                  "In Development"
                  "\nClick here to return",
                  style: GoogleFonts.sourceSans3(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
