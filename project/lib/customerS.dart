import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/profile.dart';

class CustomerSupport extends StatefulWidget {
  const CustomerSupport({super.key});

  @override
  State<CustomerSupport> createState() => _CustomerSupportState();
}

class _CustomerSupportState extends State<CustomerSupport> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Customer Support & FAQ',
          style: GoogleFonts.inter(fontSize: 25),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () {
          Navigator.of(context).pop();
          },
        ),
      ),
    );
  }
}
