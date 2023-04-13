import 'dart:async';
import 'package:flutter/material.dart';
import 'third.dart';

class FourthScreen extends StatefulWidget {
  const FourthScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _FourthScreenState createState() => _FourthScreenState();
}

class _FourthScreenState extends State<FourthScreen> {
  TimeOfDay _time = TimeOfDay.now();
  final TimeOfDay _timee = TimeOfDay.now();

  DateTime d1 = DateTime.parse(DateTime.now().toString());
  DateTime d2 = DateTime.parse("2018-09-12 10:57:00");

  TimeOfDay? picked;

  Timer? _timer;
  Duration myDuration = Duration(days: 5);

  void startTimer() {
    _timer = Timer.periodic(
        Duration(hours: _time.hour - _timee.hour), (_) => setCountDown());
  }

  void stopTimer() {
    setState(() => _timer!.cancel());
  }

  void resetTimer() {
    stopTimer();
    setState(() => myDuration = const Duration(days: 5));
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
    // Duration myDuration = Duration(hours: _timee.hour - _time.hour);
    String strDigits(int n) => n.toString().padLeft(2, '0');
    final days = strDigits(myDuration.inDays);
    final hours = strDigits(myDuration.inHours.remainder(24));
    final minutes = strDigits(myDuration.inMinutes.remainder(60));
    final seconds = strDigits(myDuration.inSeconds.remainder(60));

    Duration diff = d1.difference(d2);

    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Timer',
            textAlign: TextAlign.left,
          ),
          Text('$days:$hours:$minutes:$seconds'),
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
          Text(
            ("Seconds: " + diff.inSeconds.toString()),
          ),
        ],
      ),
    );
  }
}
