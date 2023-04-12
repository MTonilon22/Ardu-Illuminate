import 'package:ardu_illuminate/main.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController userController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
                  style: TextStyle(
                    fontFamily: 'Poppins',
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock_open_rounded),
                    suffixIcon: Icon(Icons.remove_red_eye),
                    labelText: 'Password',
                    labelStyle: TextStyle(
                      fontFamily: 'Poppins',
                    ),
                  ),
                  style: TextStyle(
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
                  child: Flex(direction: Axis.horizontal, children: [
                    Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 25,
                        fontFamily: 'Poppins',
                        color: Colors.white,
                      ),
                    ),
                    Icon(Icons.login, color: Colors.white),
                  ]),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 100),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    primary: Color(0xFF0047FF),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
