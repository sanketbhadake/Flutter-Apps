import 'package:flutter/material.dart';
import 'package:whatsapp_clone/otp_screen.dart';
import 'package:whatsapp_clone/ui_helper.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController phonecontroller = TextEditingController();

  login(String phonecontroller) {
    if (phonecontroller == "") {
      return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Enter Phone Number"),
          backgroundColor: Color(0XFF00A884),
        ),
      );
    } else {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) =>
              OtpScreen(phonenumber: phonecontroller.toString()),
        ),
      );
    }
  }

  String selectedcountry = "India";
  List<String> countries = ["India", "America", "Africa", "Italy", "Germany"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 80),
          Center(
            child: UiHelper.customText(
              text: "Enter your phone number",
              height: 16,
              fontweight: FontWeight.w700,
              color: Color(0XFF00A884),
            ),
          ),
          SizedBox(height: 30),
          UiHelper.customText(
            text: "WhatsApp will need to verify your phone",
            height: 16,
            fontweight: FontWeight.w700,
          ),
          UiHelper.customText(
            text: "number. Carrier charges may apply.",
            height: 16,
            fontweight: FontWeight.w700,
          ),
          UiHelper.customText(
            text: "What’s my number?",
            height: 16,
            fontweight: FontWeight.w700,
            color: Color(0XFF00A884),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 60, right: 60),
            child: DropdownButtonFormField(
              items: countries.map((String country) {
                return DropdownMenuItem(child: Text(country), value: country);
              }).toList(),
              onChanged: (newvalue) {
                setState(() {
                  selectedcountry = newvalue!;
                });
              },
              value: selectedcountry,
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0XFF00A884)),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0XFF00A884)),
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 40,
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "+91",
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0XFF00A884)),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0XFF00A884)),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0XFF00A884)),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10),
              SizedBox(
                width: 250,
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: phonecontroller,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0XFF00A884)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: UiHelper.customButton(
        callback: () {
          login(phonecontroller.text.toString());
        },
        buttonname: "Next",
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
