import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
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
        title: const Text('Create Account'),
      ),
      body: Padding(
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
                prefixIcon: Icon(Icons.person),
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Birthdate',
              style: TextStyle(fontSize: 16.0),
            ),
            GestureDetector(
              onTap: _presentDatePicker,
              child: AbsorbPointer(
                child: TextField(
                  decoration: const InputDecoration(
                    hintText: 'Select your birthdate',
                    prefixIcon: Icon(Icons.calendar_today),
                  ),
                  controller:
                      TextEditingController(text: selectedDateFormatted ?? ''),
                  keyboardType: TextInputType.datetime,
                ),
              ),
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
                prefixIcon: Icon(Icons.email),
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
                prefixIcon: Icon(Icons.account_circle),
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
                prefixIcon: Icon(Icons.lock),
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
    // TODO: Add account creation logic
    Navigator.pushNamed(context, '/login');
  },
  style: ElevatedButton.styleFrom(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30),
    ),
    backgroundColor: const Color(0xFF0047FF),
  ),
  child: const Text(
    'Create Account',
    style: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
    ),
  ),
),

          ],
        ),
      ),
    );
  }
}
