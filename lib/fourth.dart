import 'package:flutter/material.dart';

class FourthScreen extends StatefulWidget {
  const FourthScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _FourthScreenState createState() => _FourthScreenState();
}

class _FourthScreenState extends State<FourthScreen> {
  TimeOfDay _time = TimeOfDay.now();
  late TimeOfDay picked;

  Future<void> selectTime(BuildContext context) async {
    picked = (await showTimePicker(
      context: context,
      initialTime: _time,
    ))!;

    setState(() {
      _time = picked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Timer',
            textAlign: TextAlign.left,
          ),
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
