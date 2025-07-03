import 'dart:async';

import 'package:flutter/material.dart';
import 'package:whatsapp_clone/on_boarding.dart';
import 'ui_helper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.of(
        context,
      ).push(MaterialPageRoute(builder: (context) => OnBoarding()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          Center(child: Image.asset("assets/whatsapp 1.png")),
          SizedBox(height: 20),
          UiHelper.customText(
            text: "WhatsApp",
            height: 18,

            fontweight: FontWeight.w700,
          ),
        ],
      ),
    );
  }
}
