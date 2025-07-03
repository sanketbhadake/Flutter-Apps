import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:whatsapp_clone/profile_screen.dart';
import 'package:whatsapp_clone/ui_helper.dart';

class OtpScreen extends StatefulWidget {
  final String phonenumber;

  const OtpScreen({super.key, required this.phonenumber});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  TextEditingController otp1controller = TextEditingController();
  TextEditingController otp2controller = TextEditingController();

  TextEditingController otp3controller = TextEditingController();

  TextEditingController otp4controller = TextEditingController();

  TextEditingController otp5controller = TextEditingController();
  TextEditingController otp6controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: UiHelper.customText(
                text: "Verifying your number",
                height: 16,
                color: Color(0XFF00A884),
              ),
            ),
            SizedBox(height: 30),
            Center(
              child: Row(
                children: [
                  UiHelper.customText(
                    text: "You’ve tried to register +91${widget.phonenumber} ",
                    height: 15,
                  ),
                ],
              ),
            ),
            Row(
              children: [
                UiHelper.customText(
                  text: "recently. Wait before requesting an sms or a call",
                  height: 15,
                ),
              ],
            ),
            Row(
              children: [
                UiHelper.customText(
                  text: "with your code. Wrong number? ",
                  height: 15,
                ),
                UiHelper.customText(
                  text: "Wrong number?",
                  color: Color(0XFF00A884),
                  height: 15,
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                UiHelper.customContainer(otp1controller),
                SizedBox(width: 10),
                UiHelper.customContainer(otp2controller),
                SizedBox(width: 10),
                UiHelper.customContainer(otp3controller),
                SizedBox(width: 10),
                UiHelper.customContainer(otp4controller),
                SizedBox(width: 10),
                UiHelper.customContainer(otp5controller),
                SizedBox(width: 10),
                UiHelper.customContainer(otp6controller),
                SizedBox(width: 10),
              ],
            ),
            SizedBox(height: 30),
            UiHelper.customText(
              text: "Didn’t receive code?",
              height: 14,
              color: Color(0XFF00A884),
            ),
          ],
        ),
      ),
      floatingActionButton: UiHelper.customButton(
        callback: () {
          Navigator.of(
            context,
          ).push(MaterialPageRoute(builder: (context) => ProfileScreen()));
        },
        buttonname: "Next",
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
