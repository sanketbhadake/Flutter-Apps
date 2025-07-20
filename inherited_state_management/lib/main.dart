import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:inherited_state_management/controller.dart';
import 'package:inherited_state_management/signup.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyBzqtCq0vHUscckRc9gvcRvUoWcFL7jclY",
          appId: "1:335907449674:android:a58cdd27436573319d6fb3",
          messagingSenderId: "335907449674",
          projectId: "inheritedwidget-73ffa"));
  runApp(const MyWidget());
}

class MyWidget extends StatelessWidget {
  final String useremail = "";
  final String userpassword = "";

  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Signup(
        email: useremail,
        password: userpassword,
        child: MaterialApp(
          home: SignupScreen(),
        ));
  }
}
