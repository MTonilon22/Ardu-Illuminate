import 'package:flutter/material.dart';
import 'package:duration_picker/duration_picker.dart';

class FourthScreen extends StatefulWidget {
  const FourthScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _FourthScreenState createState() => _FourthScreenState();
}

class _FourthScreenState extends State<FourthScreen> {
  Duration _duration = const Duration(hours: 0, minutes: 0);
  Duration? _picked;

  Future<void> durationPicked(BuildContext context) async {
    _picked = await showDurationPicker(
        context: context, initialTime: const Duration(minutes: 20));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DurationPicker(
              // duration: _duration,
              onChange: (val) {
                _duration = val;
                setState(() {});
              },
              duration: _duration,
              snapToMins: 5.0,
            ),
            ElevatedButton(
                onPressed: () {
                  durationPicked(context);
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Choose Duration: $_picked'),
                  ));
                },
                child: const Text('show Duration Picked'))
          ],
        ),
      ),
    );
  }
}
