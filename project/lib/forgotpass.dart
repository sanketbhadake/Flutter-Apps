import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final TextEditingController _emailPhoneController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();

  void _sendOTP() {
    // Placeholder for sending OTP logic
    // Display success message
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("OTP sent to ${_emailPhoneController.text}")),
    );
  }

  void _resetPassword() {
    // Placeholder for resetting password logic
    if (_otpController.text.isNotEmpty &&
        _newPasswordController.text.length >= 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Password reset successful")),
      );
      Navigator.pop(context); // Return to login
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill all fields correctly")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Forgot Password")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
          
            children: [
              TextField(
                controller: _emailPhoneController,
                decoration: const InputDecoration(labelText: "Email or Phone"),
              ),
              ElevatedButton(
                onPressed: _sendOTP,
                child: const Text("Send OTP"),
              ),
              TextField(
                controller: _otpController,
                decoration: const InputDecoration(labelText: "Enter OTP"),
              ),
              TextField(
                controller: _newPasswordController,
                obscureText: true,
                decoration: const InputDecoration(labelText: "New Password"),
              ),
              ElevatedButton(
                onPressed: _resetPassword,
                child: const Text("Reset Password"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
