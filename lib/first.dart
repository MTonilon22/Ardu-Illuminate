import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(children: const [
        Text('This is the Use Screen'),
        Text('Testing npd')
      ]),
    );
  }
}
