// ignore_for_file: file_names

import 'package:ardu_illuminate/main.dart';
import 'package:flutter/material.dart';
import 'package:ardu_illuminate/loginpage.dart';

class CreateAccount extends StatelessWidget {
  final TextEditingController userController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  CreateAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Expanded(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(50.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/ardu-ulliminate.png',
                  width: 230,
                  height: 230,
                ),
                const SizedBox(height: 15),
                TextField(
                  controller: userController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.perm_identity_sharp),
                    labelText: 'Username',
                    labelStyle: TextStyle(
                      fontFamily: 'Poppins',
                    ),
                  ),
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.lock_open_rounded),
                    suffixIcon: Icon(Icons.remove_red_eye),
                    labelText: 'Password',
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
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MyHomePage(
                          title: '',
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 100),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    backgroundColor: const Color(0xFF0047FF),
                  ),
                  child: Flex(direction: Axis.horizontal, children: const [
                    Text(
                      'Continue',
                      style: TextStyle(
                        fontSize: 25,
                        fontFamily: 'Poppins',
                        color: Colors.white,
                      ),
                    ),
                    Icon(Icons.login, color: Colors.white),
                  ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
