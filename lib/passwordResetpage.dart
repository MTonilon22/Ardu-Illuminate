// ignore: file_names
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:ardu_illuminate/loginpage.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  ResetPasswordState createState() => ResetPasswordState();
}

class ResetPasswordState extends State<ResetPassword> {
  final TextEditingController emailController = TextEditingController();

  void _sendVerificationCode() {
    // Implement code to send verification code to the provided email
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reset Password'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 25),
                const Text(
                  'Enter the email associated with your account and we’ll send a verification code in order to reset your password.',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                  ),
                  textAlign: TextAlign.center,
                ),
                TextField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    labelText: 'Email',
                    labelStyle: TextStyle(
                      fontFamily: 'Poppins',
                    ),
                  ),
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                  ),
                ),
                const SizedBox(height: 50),
                ElevatedButton(
                  onPressed: _sendVerificationCode,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    backgroundColor: const Color(0xFF0047FF),
                  ),
                  child: const Text(
                    'Send Code',
                    style: TextStyle(
                      fontSize: 25,
                      fontFamily: 'Poppins',
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
