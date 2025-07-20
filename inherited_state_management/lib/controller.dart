import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Signup extends InheritedWidget {
    String email;
    String password;
  // ignore: prefer_const_constructors_in_immutables
  Signup({
    super.key,
    required this.email,
    required this.password,
    required super.child,
  });

  static Signup of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Signup>()!;
  }

  @override
  bool updateShouldNotify(Signup oldWidget) {
    return email != oldWidget.email;
  }
}
