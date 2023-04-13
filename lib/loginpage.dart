import 'package:ardu_illuminate/main.dart';
import 'package:flutter/material.dart';

import 'createaccountpage.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController userController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
                Column(
                  children: [
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
                      child: Flex(
                        direction: Axis.horizontal,
                        children: const [
                          Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 25,
                              fontFamily: 'Poppins',
                              color: Colors.white,
                            ),
                          ),
                          Icon(Icons.login, color: Colors.white),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          'Forgot Password? ',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            color: Colors.black,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            // Add your forgot password logic here
                          },
                          child: const Text(
                            'Click here',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Column(
                      children: [
                        const Text(
                          "Still don't have an account?",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            color: Colors.black,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const CreateAccountPage(),
                              ),
                            );
                          },
                          child: const Text(
                            'Sign-up Here!',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
