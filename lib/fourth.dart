import 'dart:async';
import 'third.dart';
import 'package:flutter/material.dart';
import 'package:duration_picker/duration_picker.dart';

class FourthScreen extends StatefulWidget {
  const FourthScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _FourthScreenState createState() => _FourthScreenState();
}

class _FourthScreenState extends State<FourthScreen> {
  Duration _picked = const Duration(hours: 0, minutes: 0);
  Timer? countdownTimer;

  // Duration myDuration = Duration(hours: 5);

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
    setState(() => _picked = const Duration(hours: 0, minutes: 0));
  }

  void setCountDown() {
    const reduceSecondsBy = 1;
    setState(() {
      final seconds = _picked!.inSeconds - reduceSecondsBy;

      if (seconds < 0) {
        countdownTimer!.cancel();
      } else {
        _picked = Duration(seconds: seconds);
      }
    });
  }

  Future<void> durationPicked(BuildContext context) async {
    _picked = (await showDurationPicker(
      context: context,
      initialTime: const Duration(minutes: 15),
    ))!;
  }

  @override
  Widget build(BuildContext context) {
    String strDigits(int n) => n.toString().padLeft(2, '0');
    final hours = strDigits(_picked.inHours.remainder(24));
    final minutes = strDigits(_picked.inMinutes.remainder(60));
    final seconds = strDigits(_picked.inSeconds.remainder(60));
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
