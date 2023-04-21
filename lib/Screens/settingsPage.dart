import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _darkMode = false;

  void _logout(BuildContext context) {
    // Implement code to logout the user
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _darkMode
          ? ThemeData.dark()
          : ThemeData.light(), // Modify the theme based on _darkMode value
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Settings'),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(height: 5),
                  const Text(
                    'Profile',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 50),

                  // Add profile settings here
                  Card(
                    child: Column(
                      children: [
                        SwitchListTile(
                          title: const Text(
                            'Dark Mode',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 16,
                            ),
                          ),
                          secondary: _darkMode
                              ? const Icon(Icons.nights_stay)
                              : const Icon(Icons.wb_sunny),
                          value: _darkMode,
                          onChanged: (bool value) {
                            setState(() {
                              _darkMode = value;
                            });
                          },
                        ),
                        const Divider(),
                        ListTile(
                          title: const Text(
                            'Name',
                            style: TextStyle(fontFamily: 'Poppins'),
                          ),
                          subtitle: const Text(
                            'Jeremy Andy',
                            style: TextStyle(fontFamily: 'Poppins'),
                          ),
                          trailing: IconButton(
                            icon: const Icon(Icons.edit_square),
                            onPressed: () {
                              // Implement code to edit name
                            },
                          ),
                        ),
                        const Divider(),
                        ListTile(
                          title: const Text(
                            'Email',
                            style: TextStyle(fontFamily: 'Poppins'),
                          ),
                          subtitle: const Text(
                            'jeremyandyampatin@gmail.com',
                            style: TextStyle(fontFamily: 'Poppins'),
                          ),
                          trailing: IconButton(
                            icon: const Icon(Icons.edit_square),
                            onPressed: () {
                              // Implement code to edit email
                            },
                          ),
                        ),
                        const Divider(),
                        ListTile(
                          title: const Text(
                            'Password',
                            style: TextStyle(fontFamily: 'Poppins'),
                          ),
                          subtitle: const Text('**********'),
                          trailing: IconButton(
                            icon: const Icon(Icons.edit_square),
                            onPressed: () {
                              // Implement code to change password
                            },
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 50),

                  ElevatedButton(
                    onPressed: () {
                      _logout(context);
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      backgroundColor: const Color(0xFF0047FF),
                    ),
                    child: const Text(
                      'Logout',
                      style: TextStyle(
                        fontSize: 25,
                        fontFamily: 'Poppins',
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
