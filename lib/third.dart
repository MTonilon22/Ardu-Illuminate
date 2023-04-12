import 'package:flutter/material.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ThirdScreenState createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  bool light1 = true;
  late Color activeColor = Colors.green;
  double _currentSliderValue = 20;

  final MaterialStateProperty<Icon?> thumbIcon =
      MaterialStateProperty.resolveWith<Icon?>(
    (Set<MaterialState> states) {
      if (states.contains(MaterialState.selected)) {
        return const Icon(Icons.check);
      }
      return const Icon(Icons.close);
    },
  );

  void _onChanged(bool value) {
    setState(() {
      light1 = value;
      activeColor = value ? Colors.green : Colors.red;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Main Light',
            textAlign: TextAlign.left,
          ),
          Switch(
            thumbIcon: thumbIcon,
            value: light1,
            inactiveThumbColor: Colors.red,
            activeColor: activeColor,
            onChanged: _onChanged,
          ),
          const Text(
            'Light Intensity',
          ),
          Slider(
            value: _currentSliderValue,
            max: 100,
            divisions: 100,
            label: _currentSliderValue.round().toString(),
            onChanged: (double value) {
              setState(() {
                _currentSliderValue = value;
              });
            },
          )
        ],
      ),
    );
  }
}
