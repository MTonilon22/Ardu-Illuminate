// ignore_for_file: library_private_types_in_public_api

import 'package:ardu_illuminate/loginpage.dart';
import 'package:ardu_illuminate/main.dart';
import 'package:flutter/material.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({Key? key}) : super(key: key);

  @override
  _CreateAccountPageState createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool _agreeToTermsAndPrivacy = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Account'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Full Name',
              style: TextStyle(fontSize: 16.0),
            ),
            TextField(
              controller: fullNameController,
              decoration: const InputDecoration(
                hintText: 'Enter your full name',
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Age',
              style: TextStyle(fontSize: 16.0),
            ),
            TextField(
              controller: ageController,
              decoration: const InputDecoration(
                hintText: 'Enter your age',
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Email',
              style: TextStyle(fontSize: 16.0),
            ),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                hintText: 'Enter your email',
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Username',
              style: TextStyle(fontSize: 16.0),
            ),
            TextField(
              controller: usernameController,
              decoration: const InputDecoration(
                hintText: 'Enter your username',
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Password',
              style: TextStyle(fontSize: 16.0),
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                hintText: 'Enter your password',
              ),
            ),
            const SizedBox(height: 16.0),
            Row(
              children: <Widget>[
                Checkbox(
                  value: _agreeToTermsAndPrivacy,
                  onChanged: (value) {
                    setState(() {
                      _agreeToTermsAndPrivacy = value!;
                    });
                  },
                ),
                const Expanded(
                  child: Text(
                    'By signing up, you agree to our Terms and Data Policy.',
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginPage(
                        //title: '',
                        ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                backgroundColor: Color(0xFF0047FF),
              ),
              child: const Text(
                'Create Account',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
