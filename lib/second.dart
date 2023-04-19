import 'package:ardu_illuminate/loginpage.dart';
import 'package:flutter/material.dart';

class EnlighteningDetails extends StatelessWidget {
  const EnlighteningDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Enlightening Details'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Fill-up the following Information Below, such as the Bulb Model, Manufacturer and the Installation date.',
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 16,
                  color: Color(0xFF0047FF)),
            ),
            const SizedBox(
              height: 30,
            ),
            const TextField(
              enabled: false,
              decoration: InputDecoration(
                hintText: 'E-27 Bulb 18W',
                prefixIcon: Icon(Icons.lightbulb),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const TextField(
              enabled: false,
              decoration: InputDecoration(
                hintText: 'EcoShift Corporation',
                prefixIcon: Icon(Icons.precision_manufacturing),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              child: Text(
                'UPDATE',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                backgroundColor: const Color(0xFF0047FF),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
