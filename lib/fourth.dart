/*import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'third.dart';

class FourthScreen extends StatefulWidget {
  const FourthScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _FourthScreenState createState() => _FourthScreenState();
}

class _FourthScreenState extends State<FourthScreen> {
  TimeOfDay _time = TimeOfDay.now();
  TimeOfDay _timee = TimeOfDay.now();
  TimeOfDay? picked;
  DateTime? parsedTime;
  Timer? _timer;
  int oten = 30;
  Duration? myDuration;
  var format = DateFormat("HH:mm:ss");

  void startTimer() {
    myDuration = Duration(days: 10);
    _timer = Timer.periodic(const Duration(seconds: 1), (_) => setCountDown());
    print(myDuration);
  }

  void stopTimer() {
    setState(() => _timer!.cancel());
  }

  void resetTimer() {
    stopTimer();
    setState(() => myDuration = Duration(hours: _time.hour - _timee.hour));
  }

  void setCountDown() {
    // ignore: prefer_const_declarations
    final reduceSecondsby = 1;

    setState(() {
      final seconds = myDuration.inSeconds - reduceSecondsby;

      if (seconds < 0) {
        _timer!.cancel();
      } else {
        myDuration = Duration(seconds: seconds);
      }
    });
  }

  Future<void> selectTime(BuildContext context) async {
    picked = (await showTimePicker(
      context: context,
      initialTime: _time,
    ))!;

    setState(() {
      _time = picked!;
      print(TimeOfDay.now());
      print(_time);
    });
  }

  @override
  Widget build(BuildContext context) {
    String strDigits(int n) => n.toString().padLeft(2, '0');
    final days = strDigits(myDuration.inDays);
    final hours = strDigits(myDuration.inHours.remainder(24));
    final minutes = strDigits(myDuration.inMinutes.remainder(60));
    final seconds = strDigits(myDuration.inSeconds.remainder(60));

    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Timer',
            textAlign: TextAlign.left,
          ),
          Text('$hours:$minutes:$seconds'),
          IconButton(
            iconSize: 80,
            icon: const Icon(
              Icons.alarm,
              size: 80,
            ),
            onPressed: () {
              selectTime(context);
            },
          ),
          ElevatedButton(
            onPressed: startTimer,
            child: Text(
              'Start',
              style: TextStyle(
                fontSize: 30,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (_timer == null || _timer!.isActive) {
                stopTimer();
              }
            },
            child: Text(
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
              child: Text(
                'Reset',
                style: TextStyle(
                  fontSize: 30,
                ),
              )),
          const SizedBox(
            height: 60,
          ),
          Text(
            '$_time',
            style: const TextStyle(
              fontSize: 40,
            ),
          ),
        ],
      ),
    );
  }
}
*/