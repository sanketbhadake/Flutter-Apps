import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Trashscreen extends StatefulWidget {
  const Trashscreen({super.key});

  @override
  State<Trashscreen> createState() => _TrashscreenState();
}

class _TrashscreenState extends State<Trashscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Trash",
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w500,
            )),
      ),
      body: ListView.builder(
        itemCount: 2,
        shrinkWrap: true,
        itemBuilder: (context, index) => Container(
          height: 80,
          width: 100,
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(width: 0.3),
            ),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(9.0),
                child: Container(
                  height: 60,
                  width: 60,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    // color: Colors.amber
                  ),
                  child: Center(
                    child: Image.asset(
                      "assets/Subtract trash.png",
                    ),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Text(
                        "Medicine",
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      // // Spacer(),
                      const SizedBox(
                        width: 180,
                      ),

                      Text("500",
                          style: GoogleFonts.poppins(
                              fontSize: 14, fontWeight: FontWeight.w500)),
                    ],
                  ),
                  Text(
                    "Lorem Ipsum is simply dummy text of the ",
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 217,
                      ),
                      Text(
                        "3 June | 11:50 AM",
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          color: const Color.fromRGBO(0, 0, 0, 0.6),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
