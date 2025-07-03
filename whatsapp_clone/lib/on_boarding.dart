import 'package:flutter/material.dart';
import 'package:whatsapp_clone/login_screen.dart';
import 'package:whatsapp_clone/ui_helper.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Image.asset("assets/image 1.png")),
          SizedBox(height: 20),
          UiHelper.customText(
            text: "Welcome to WhatsApp",
            height: 20,
            fontweight: FontWeight.bold,
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              UiHelper.customText(
                text: "Read out ",
                height: 14,
                fontweight: FontWeight.w400,
              ),
              UiHelper.customText(
                text: "Privacy Policy.”",
                height: 14,
                fontweight: FontWeight.w400,
                color: Color(0XFF0C42CC),
              ),
              UiHelper.customText(
                text: "Tap “Agree and continue.”",
                height: 14,
                fontweight: FontWeight.w400,
                color: Color(0XFF0C42CC),
              ),
            ],
          ),
          SizedBox(height: 2),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              UiHelper.customText(
                text: "to accept the ",
                height: 14,
                fontweight: FontWeight.w400,
              ),
              UiHelper.customText(
                text: "Teams of Service.",
                height: 14,
                fontweight: FontWeight.w400,
                color: Color(0XFF0C42CC),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: UiHelper.customButton(
        callback: () {
          Navigator.of(
            context,
          ).push(MaterialPageRoute(builder: (context) => LoginScreen()));
        },
        buttonname: "Agree and continue",
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
