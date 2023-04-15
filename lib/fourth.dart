import 'dart:async';

import 'package:flutter/material.dart';
import 'package:duration_picker/duration_picker.dart';

class FourthScreen extends StatefulWidget {
  const FourthScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _FourthScreenState createState() => _FourthScreenState();
}

class _FourthScreenState extends State<FourthScreen> {
  Duration? _picked;
  Timer? countdownTimer;

  Duration myDuration = Duration(hours: 5);

  @override
  void initState() {
    super.initState();
  }

  void startTimer() {
    countdownTimer =
        Timer.periodic(const Duration(seconds: 1), (_) => setCountDown());
  }

  void stopTimer() {
    setState(() => countdownTimer!.cancel());
  }

  void resetTimer() {
    stopTimer();
    setState(() => myDuration = const Duration(hours: 0, minutes: 0));
  }

  void setCountDown() {
    const reduceSecondsBy = 1;
    setState(() {
      final seconds = myDuration.inSeconds - reduceSecondsBy;

      if (seconds < 0) {
        countdownTimer!.cancel();
      } else {
        myDuration = Duration(seconds: seconds);
      }
    });
  }

  Future<Duration?> durationPicked(BuildContext context) async {
    _picked = await showDurationPicker(
      context: context,
      initialTime: const Duration(minutes: 15),
    );

    return _picked;
  }

  @override
  Widget build(BuildContext context) {
    String strDigits(int n) => n.toString().padLeft(2, '0');

    final hours = strDigits(myDuration.inHours.remainder(24));
    final minutes = strDigits(myDuration.inMinutes.remainder(60));
    final seconds = strDigits(myDuration.inSeconds.remainder(60));
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                    onPressed: () {
                      durationPicked(context);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Choose Duration: $_picked'),
                      ));
                    },
                    child: const Icon(Icons.timer)),
                Text('$hours:$minutes:$seconds'),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: startTimer,
                  child: const Text(
                    'Start',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (countdownTimer == null || countdownTimer!.isActive) {
                      stopTimer();
                    }
                  },
                  child: const Text(
                    'Stop',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    resetTimer();
                  },
                  child: const Text(
                    'Reset',
                    style: TextStyle(
                      fontSize: 30,
                    ),
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
