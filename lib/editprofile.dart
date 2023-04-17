import 'package:ardu_illuminate/first.dart';
import 'package:flutter/material.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile View'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Full Name',
              style: TextStyle(fontSize: 16, fontFamily: 'Poppins'),
            ),
            const TextField(
              enabled: true,
              decoration: InputDecoration(
                hintText: 'Jeremy Andy Ampatin',
                prefixIcon: Icon(Icons.person),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            const Text(
              'Birthdate',
              style: TextStyle(fontSize: 16, fontFamily: 'Poppins'),
            ),
            const TextField(
              enabled: true,
              decoration: InputDecoration(
                hintText: 'January 69, 6969',
                prefixIcon: Icon(Icons.calendar_today),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            const Text(
              'Email',
              style: TextStyle(fontSize: 16, fontFamily: 'Poppins'),
            ),
            const TextField(
              enabled: true,
              decoration: InputDecoration(
                hintText: 'jeremyandyampatin@gmail.com',
                prefixIcon: Icon(Icons.mark_email_read),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Username',
              style: TextStyle(fontSize: 16, fontFamily: 'Poppins'),
            ),
            const TextField(
              decoration: InputDecoration(
                enabled: true,
                hintText: 'Jeremy_Andy',
                prefixIcon: Icon(Icons.account_circle),
              ),
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const FirstScreen(),
                      ),
                    );
                  },
                  child: Text(
                    'ACCEPT CHANGES',
                    style: TextStyle(
                        fontSize: 13,
                        fontFamily: 'Poppins',
                        color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(15.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    backgroundColor: Color(0xFF0047FF),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
