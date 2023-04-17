import 'package:flutter/material.dart';
import 'webSocket.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ThirdScreenState createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  bool light1 = false;
  Color activeColor = Colors.green;
  double _currentSliderValue = 20;
  bool ledstatus = false;

  late Websocket ws = Websocket();

  void initstate() {
    Future.delayed(Duration.zero, () async {
      ws.channelconnect();
    });

    super.initState();
  }

  final MaterialStateProperty<Icon?> thumbIcon =
      MaterialStateProperty.resolveWith<Icon?>(
    (Set<MaterialState> states) {
      if (states.contains(MaterialState.selected)) {
        return const Icon(Icons.check);
      }
      return const Icon(Icons.close);
    },
  );

  void _onPressed(bool value) {
    if (ledstatus) {
      ws.sendcmd("poweroff");
      ledstatus = false;
    } else {
      ws.sendcmd("poweron");
      ledstatus = true;
    }
    setState(() {
      light1 = value;
      activeColor = value ? Colors.green : Colors.red;
    });
  }

  void _onSliderChanged(double value) {
    var brightness = value.toString();
    ws.sendcmd("brightness$brightness");
    setState(() {
      _currentSliderValue = value;
      print(brightness);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
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
              onChanged: _onPressed,
            ),
            const Text(
              'Light Intensity',
            ),
            Slider(
              value: _currentSliderValue,
              max: 100,
              divisions: 100,
              label: _currentSliderValue.round().toString(),
              onChanged: _onSliderChanged,
            ),
          ],
        ),
      ),
    );
  }
}
