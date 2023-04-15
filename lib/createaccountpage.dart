import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({Key? key}) : super(key: key);

  @override
  _CreateAccountPageState createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  DateTime? _selectedDate;
  bool _agreeToTermsAndPrivacy = false;

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final DateFormat dateFormat = DateFormat('MMM d, yyyy');
    final String? selectedDateFormatted =
        _selectedDate == null ? null : dateFormat.format(_selectedDate!);

    return Scaffold(
      appBar: AppBar(
        title: Text('Create Account'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Full Name',
              style: TextStyle(fontSize: 16.0),
            ),
            TextField(
              controller: fullNameController,
              decoration: InputDecoration(
                hintText: 'Enter your full name',
                prefixIcon: Icon(Icons.person),
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Birthdate',
              style: TextStyle(fontSize: 16.0),
            ),
            GestureDetector(
              onTap: _presentDatePicker,
              child: AbsorbPointer(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Select your birthdate',
                    prefixIcon: Icon(Icons.calendar_today),
                  ),
                  controller: TextEditingController(
                      text: selectedDateFormatted ?? ''),
                  keyboardType: TextInputType.datetime,
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Email',
              style: TextStyle(fontSize: 16.0),
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: 'Enter your email',
                prefixIcon: Icon(Icons.email),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 16.0),
            Text(
              'Username',
              style: TextStyle(fontSize: 16.0),
            ),
            TextField(
              controller: usernameController,
              decoration: InputDecoration(
                hintText: 'Enter your username',
                prefixIcon: Icon(Icons.account_circle),
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Password',
              style: TextStyle(fontSize: 16.0),
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Enter your password',
                prefixIcon: Icon(Icons.lock),
              ),
            ),
            SizedBox(height: 16.0),
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
                Expanded(
                  child: Text(
                    'By signing up, you agree to our Terms and Data Policy.',
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
              ],
            ),
            SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: () {
                // TODO: Add account creation logic
              },
              child: Text('Create Account'),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                primary: Color(0xFF0047FF),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
